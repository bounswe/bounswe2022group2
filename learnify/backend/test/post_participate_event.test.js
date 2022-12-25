import assert from 'assert';
import request from 'supertest';
import { Event } from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";

describe('POST /api/events/participate/:event', () => {
  let eventId;
  let token;

  beforeEach(async () => {
    // Create a new event in the database
    const event = new Event({
      name: 'Test Event',
      num_participants: 0
    });
    await event.save();
    eventId = event._id;
    // Create a JWT for an authenticated user
    token = jwt.sign({ username: 'testuser' }, 'secret');
  });

  it('should return 401 if the authorization header is missing', async () => {
    const res = await request(app)
      .post(`/events/participate/${eventId}`)
      .set('Accept', 'application/json');

    assert.strictEqual(res.status, 401);
    assert.strictEqual(res.body.resultMessage, 'There is something wrong with your auth token.');
  });

  it('should return 401 if the authorization header is invalid', async () => {
    const res = await request(app)
      .post(`/events/participate/${eventId}`)
      .set('Authorization', 'invalid_token')
      .set('Accept', 'application/json');

    assert.strictEqual(res.status, 401);
    assert.strictEqual(res.body.resultMessage, 'There is something wrong with your auth token.');
  });

  it('should return 409 if the event does not exist', async () => {
    const res = await request(app)
      .post('/events/participate/invalid_id')
      .set('Authorization', `Bearer ${token}`)
      .set('Accept', 'application/json');

    assert.strictEqual(res.status, 409);
    assert.strictEqual(res.body.resultMessage, 'The event does not exists');
  });

  it('should return 500 if there is an error while fetching the event from the database', async () => {
    // Set up a stub for the Event model's findOne method to throw an error
    Event.findOne = () => { throw new Error('findOne error') };

    const res = await request(app)
      .post(`/events/participate/${eventId}`)
      .set('Authorization', `Bearer ${token}`)
      .set('Accept', 'application/json');

    assert.strictEqual(res.status, 500);
    assert.strictEqual(res.body.resultMessage, 'Something is wrong.');
  });

});