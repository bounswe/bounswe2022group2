import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Event, User } from '../src/models/index.js';
import app from './../src/app.js';

const event_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const invalid_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const lesson_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];

const events = [
  {
    _id: event_ids[0],
    title: "Event1",
    description: "I am the first event",
    date: "09.09.2099",
    location: "greenwich moseley row",
    host_id: user_ids[2],
    lesson_id: lesson_ids[0]
  },
  {
    _id: event_ids[1],
    title: "Event2",
    description: "I am the second event",
    date: "09.09.2023",
    location: "greenwich moseley row",
    host_id: user_ids[2],
    lesson_id: lesson_ids[0]
  },
  {
    _id: event_ids[2],
    title: "Event3",
    description: "I am the third event",
    date: "09.09.2035",
    location: "greenwich moseley row",
    host_id: user_ids[2],
    lesson_id: lesson_ids[0]
  }
];

const users = [
    {
        _id: user_ids[0],
        email: "user1@gmail.com",
        password: "password1",
        name: "username1",
        enrolledLessons: [lesson_ids[0],lesson_ids[1],lesson_ids[2]],
        attendedEvents: [event_ids[0]]
    },
    {
        _id: user_ids[1],
        email: "user2@gmail.com",
        password: "password2",
        name: "username2",
        enrolledLessons: [lesson_ids[1],lesson_ids[2]],
        attendedEvents: [event_ids[0]]
    }
]

const setEvents = async () => {
    await new Event(events[0]).save();
    await new Event(events[1]).save();
    await new Event(events[2]).save();
  }

const setUsers = async () => {
    await new User(users[0]).save();
    await new User(users[1]).save();
}

const addDummyData = async () => {
  await setEvents();
  await setUsers();
};


describe('POST /user/attend', () => {
  const attendUrl = '/user/attend';
  beforeEach(addDummyData);

  it('should return validation error if the user_id is missing in body', (done) => {
    request(app)
      .post(attendUrl)
      .send({event_id: event_ids[0]})
      .expect(400)
      .end(done);
  });

  it('should return validation error if the event_id is missing in body', (done) => {
    request(app)
      .post(attendUrl)
      .send({user_id: user_ids[0]})
      .expect(400)
      .end(done);
  });

  it('should return validation error if the user_id is invalid in body', (done) => {
    request(app)
      .post(attendUrl)
      .send({
        user_id: "id",  
        event_id: event_ids[0]
       })
      .expect(400)
      .end(done);
  });

  it('should return validation error if the event_id is invalid in body', (done) => {
    request(app)
      .post(attendUrl)
      .send({
        user_id: user_ids[0],  
        event_id: "55444645161"
       })
      .expect(400)
      .end(done);
  });

  it('should return not found error if the user with the given user_id does not exist', (done) => {
    request(app)
      .post(attendUrl)
      .send({
        user_id: invalid_ids[0],  
        event_id: event_ids[0]
       })
      .expect(404)
      .end(done);
  });

  it('should return not found error if the event with the given event_id does not exist', (done) => {
    request(app)
      .post(attendUrl)
      .send({
        user_id: user_ids[0],  
        event_id: invalid_ids[1]
       })
      .expect(404)
      .end(done);
  });

  it('should return bad request error if the user with the given user_id has already attended the event with the given event_id', (done) => {
    request(app)
      .post(attendUrl)
      .send({
        user_id: user_ids[1],  
        event_id: event_ids[0]
       })
      .expect(400)
      .end(done);
  });

  it('should return the user with the given user_id with the updated attendedEvents list and attended event with the given event_id', (done) => {

    request(app)
      .post(attendUrl)
      .send({ user_id: user_ids[0], event_id: event_ids[1] })
      .expect((res) => {
        expect(res.body.user).not.toBeNull();
        expect(res.body.user).not.toBeUndefined();
        expect(res.body.user.email).not.toBeNull();
        expect(res.body.user.email).not.toBeUndefined();
        expect(res.body.user.name).not.toBeNull();
        expect(res.body.user.name).not.toBeUndefined();
        expect(res.body.user.enrolledLessons).not.toBeNull();
        expect(res.body.user.enrolledLessons).not.toBeUndefined();
        expect(res.body.user.enrolledLessons).toHaveLength(3);
        expect(res.body.user.attendedEvents).not.toBeNull();
        expect(res.body.user.attendedEvents).not.toBeUndefined();
        expect(res.body.user.attendedEvents).toHaveLength(2);
        expect(res.body.event).not.toBeNull();
        expect(res.body.event).not.toBeUndefined();
        expect(res.body.event._id).not.toBeNull();
        expect(res.body.event._id).not.toBeUndefined();
        const firstEvent = res.body.user.attendedEvents[0];
        expect(firstEvent).not.toBeNull();
        expect(firstEvent).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });

  it('should return the user with the given user_id with the updated attendedEvents list and attended event with the given event_id', (done) => {

    request(app)
      .post(attendUrl)
      .send({ user_id: user_ids[1], event_id: event_ids[1] })
      .expect((res) => {
        expect(res.body.user).not.toBeNull();
        expect(res.body.user).not.toBeUndefined();
        expect(res.body.user.email).not.toBeNull();
        expect(res.body.user.email).not.toBeUndefined();
        expect(res.body.user.name).not.toBeNull();
        expect(res.body.user.name).not.toBeUndefined();
        expect(res.body.user.enrolledLessons).not.toBeNull();
        expect(res.body.user.enrolledLessons).not.toBeUndefined();
        expect(res.body.user.enrolledLessons).toHaveLength(2);
        expect(res.body.user.attendedEvents).not.toBeNull();
        expect(res.body.user.attendedEvents).not.toBeUndefined();
        expect(res.body.user.attendedEvents).toHaveLength(2);
        expect(res.body.event).not.toBeNull();
        expect(res.body.event).not.toBeUndefined();
        expect(res.body.event._id).not.toBeNull();
        expect(res.body.event._id).not.toBeUndefined();
        const firstEvent = res.body.user.attendedEvents[0];
        expect(firstEvent).not.toBeNull();
        expect(firstEvent).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });

});

afterEach(async () => {
  await User.deleteMany({ _id: {$in: user_ids}});
  await Event.deleteMany({ _id: {$in: event_ids}});
}); 
