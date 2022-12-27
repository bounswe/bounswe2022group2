import assert from 'assert';
import request from 'supertest';
import { LearningSpace, User , Event} from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";
import sinon from 'sinon';
import { expect } from 'expect';

const token = "token"        
const username = "username"
describe('POST /events', () => {
    beforeEach(() => {
        sinon.stub(jwt, "decode")
        .onFirstCall().resolves(
          {username}
        );
        Event.deleteOne({title: "Test Event"});
    });
    afterEach(() => { sinon.restore();})
  it('creates an event with valid inputs', (done) => {
    sinon.stub(LearningSpace, "exists")
        .onFirstCall().resolves(
          true);
    sinon.stub(Event, "exists")
        .onFirstCall().resolves(
          false);
    let r = (Math.random() + 1).toString(36).substring(7);
    request(app)
      .post('/events')
      .send({
        title: r + 'Test Event',
        description: 'This is a test event',
        date: '2022-01-01',
        duration: 2,
        participationLimit: 10,
        geolocation: {"accuracy": 2.1 ,"longitude": 3.15, "latitude": 11.12},
        lsId: '12345'
      })
      .set('Authorization', 'Bearer valid_token')
      .expect(200)
      .end((err, res) => {
        if (err) return done(err);
        assert.strictEqual(res.body.resultMessage, 'Event is succesfully created.');
        assert.strictEqual(res.body.event.title,r +  'Test Event');
        assert.strictEqual(res.body.event.description, 'This is a test event');
        assert.strictEqual(res.body.event.duration, 2);
        expect(res.body.event.geolocation.accuracy).toBe(2.1);
        expect(res.body.event.geolocation.longitude).toBe(3.15);
        expect(res.body.event.geolocation.latitude).toBe(11.12);
        assert.strictEqual(res.body.event.lsId, '12345');
        done();
      });
  });

  it('returns an error with invalid inputs', (done) => {
    sinon.stub(LearningSpace, "exists")
        .onFirstCall().resolves(
          true);
    request(app)
      .post('/events')
      .send({
        title: '',
        description: 'This is a test event',
        date: '2022-01-01',
        duration: 2,
        geolocation: {"accuracy": 2.1 ,"longitude": 3.15, "latitude": 11.12},
        lsId: '12345'
      })
      .set('Authorization', 'Bearer valid_token')
      .expect(400)
      .end((err, res) => {
        if (err) return done(err);
        assert.strictEqual(res.body.resultMessage, 'Please check your inputs.');
        done();
      });
  });

  it('returns an error if the learning space does not exists', (done) => {
    let r = (Math.random() + 1).toString(36).substring(7);
    sinon.stub(LearningSpace, "exists")
        .onFirstCall().resolves(
          false);
    request(app)
      .post('/events')
      .send({
        title:r +  'Test Event',
        description: 'This is a test event',
        date: '2022-01-01',
        duration: 2,
        participationLimit: 10,
        geolocation: {accuracy: 2.1 ,longitude: 3.15, latitude: 11.12},
        lsId: '12345'
      })
      .set('Authorization', 'token')
      .expect(409)
      .end((err, res) => {
        if (err) return done(err);
        assert.strictEqual(res.body.resultMessage, 'LS with given id does not exists');
        done();
      });
  });
});
