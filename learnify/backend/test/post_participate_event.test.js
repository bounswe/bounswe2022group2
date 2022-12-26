import assert from 'assert';
import { expect } from 'expect';
import request from 'supertest';
import { Event } from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";
import sinon from 'sinon';
let r = (Math.random() + 1).toString(36).substring(7);
const event = new Event({
  title: r + 'Test Event',
  description: 'This is a test event',
  date: '2022-01-01',
  duration: 2,
  participationLimit: 10,
  geolocation: {"accuracy": 2.1 ,"longitude": 3.15, "latitude": 11.12},
  participants: [],
  lsId: '12345'
});
await event.save();
describe('POST /api/events/participate/:event', () => {
  let eventId;
  let token;
  let username = "user";
  beforeEach(() => {
    eventId = event._id;
    // Create a JWT for an authenticated user
    sinon.stub(jwt, "decode")
    .onFirstCall().resolves(
      {username}
    );
    token = "1213";
  });
  afterEach(() => { sinon.restore();})

  it('should return 409 if the event does not exist', async () => {
    sinon.stub(Event, "exists")
        .onFirstCall().resolves(
          false);
    sinon.stub(Event, "findOne")
    .onFirstCall().resolves(
      undefined);
    const res = await request(app)
      .post('/events/participate/invalid_id')
      .set('Authorization', `Bearer ${token}`)
      .set('Accept', 'application/json');

    assert.strictEqual(res.status, 409);
    assert.strictEqual(res.body.resultMessage, 'The event does not exists');
  });
  it('should participate event', async () => {
    sinon.stub(Event, "exists")
        .onFirstCall().resolves(
          false);
    const res = await request(app)
      .post(`/events/participate/${eventId}`)
      .set('Authorization', `Bearer ${token}`)
      .set('Accept', 'application/json');
    console.log(res.body.event.participants)
    expect(res.body.event.participants.includes(username))
  });

});