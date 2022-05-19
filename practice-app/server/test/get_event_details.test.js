import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Event } from '../src/models/index.js';
import app from './../src/app.js';

const lesson_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const event_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const dates = [new Date(2022,4,23), new Date(2022,5,19), new Date(2022,10,29)];
const invalid_id = mongoose.Types.ObjectId();

const events = [
    {
        _id: event_ids[0],
        title: "Test Event 1",
        description: "Event description 1",
        date: dates[0],
        location: "Greenwich",
        host_id: user_ids[0],
        lesson_id: lesson_ids[0]
    },
    {
        _id: event_ids[1],
        title: "Test Event 2",
        description: "Event description 2",
        date: dates[1],
        location: "Greenwich",
        host_id: user_ids[0],
        lesson_id: lesson_ids[0]
    },
    {
        _id: event_ids[2],
        title: "Test Event 3",
        description: "Event description 3",
        date: dates[2],
        location: "Greenwich",
        host_id: user_ids[1],
        lesson_id: lesson_ids[1]
    },
];

const setEvents = async () => {
    await new Event(events[0]).save();
    await new Event(events[1]).save();
    await new Event(events[2]).save();
}

const addDummyData = async () => {
  await setEvents();
};

describe('GET /event/details', () => {
  const eventDetails = '/event/details';
  beforeEach(addDummyData);
  
  it('should return validation error if the event_id is missing in query', (done) => {
    request(app)
      .get(eventDetails)
      .query({})
      .expect(400)
      .end(done);
  });

  it('should return validation error if the event_id in query is invalid', (done) => {
    request(app)
      .get(eventDetails)
      .query({event_id: "148648451"})
      .expect(400)
      .end(done);
  });

  it('should return not found error if an event with the given event_id in query does not exist', (done) => {
    request(app)
      .get(eventDetails)
      .query({event_id: invalid_id.toString()})
      .expect(404)
      .end(done);
  });

  it('should return the details of the specific event with the given event_id with the status code 200', (done) => {
    request(app)
      .get(eventDetails)
      .query({event_id: event_ids[0].toString()})
      .expect((res) => {
        expect(res.body.event).not.toBeNull();
        expect(res.body.event).not.toBeUndefined();
        const firstEvent = res.body.event;
        expect(firstEvent).not.toBeNull();
        expect(firstEvent).not.toBeUndefined();
        expect(firstEvent.title).not.toBeNull();
        expect(firstEvent.title).not.toBeUndefined();
        expect(firstEvent.date).not.toBeNull();
        expect(firstEvent.date).not.toBeUndefined();
        expect(firstEvent.lesson_id).not.toBeNull();
        expect(firstEvent.lesson_id).not.toBeUndefined();
        expect(firstEvent.location).not.toBeNull();
        expect(firstEvent.location).not.toBeUndefined();
        expect(firstEvent.host_id).not.toBeNull();
        expect(firstEvent.host_id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });

  it('should return the details of the specific event with the given event_id with the status code 200', (done) => {
    request(app)
      .get(eventDetails)
      .query({event_id: event_ids[1].toString()})
      .expect((res) => {
        expect(res.body.event).not.toBeNull();
        expect(res.body.event).not.toBeUndefined();
        const firstEvent = res.body.event;
        expect(firstEvent).not.toBeNull();
        expect(firstEvent).not.toBeUndefined();
        expect(firstEvent.title).not.toBeNull();
        expect(firstEvent.title).not.toBeUndefined();
        expect(firstEvent.date).not.toBeNull();
        expect(firstEvent.date).not.toBeUndefined();
        expect(firstEvent.lesson_id).not.toBeNull();
        expect(firstEvent.lesson_id).not.toBeUndefined();
        expect(firstEvent.location).not.toBeNull();
        expect(firstEvent.location).not.toBeUndefined();
        expect(firstEvent.host_id).not.toBeNull();
        expect(firstEvent.host_id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
  
});

afterEach(async () => {
  await Event.deleteMany({ _id: {$in: event_ids}});
});
