import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, User, Lesson, Event } from '../src/models/index.js';
import app from './../src/app.js';

const categoryId = mongoose.Types.ObjectId();
const lesson_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const lecturer_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const event_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const dates = [new Date(2022,4,23), new Date(2022,5,19), new Date(2022,10,29)];
const invalid_id = mongoose.Types.ObjectId();

const category = {
  _id: categoryId,
  title: "Category1",
  description: "Description1",
}

const lessons = [
  {
    _id: lesson_ids[0],
    name: "Lesson1",
    category_id: category._id,
    lecturer: lecturer_ids[0]
  },
  {
    _id: lesson_ids[1],
    name: "Lesson2",
    category_id: category._id,
    lecturer: lecturer_ids[1]
  },
];

const users = [
    {
        _id: user_ids[0],
        email: "user1@gmail.com",
        password: "password1",
        name: "username1",
        enrolledLessons: [],
        attendedEvents: []
    },
    {
        _id: user_ids[1],
        email: "user2@gmail.com",
        password: "password2",
        name: "username2",
        enrolledLessons: [],
        attendedEvents: []
    }
];

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

const setCategory = async () => {
  await new Category(category).save();
}

const setLessons = async () => {
  await new Lesson(lessons[0]).save();
  await new Lesson(lessons[1]).save();
}

const setUsers = async () => {
    await new User(users[0]).save();
    await new User(users[1]).save();
}

const setEvents = async () => {
    await new Event(events[0]).save();
    await new Event(events[1]).save();
    await new Event(events[2]).save();
}

const addDummyData = async () => {
  await setCategory();
  await setLessons();
  await setUsers();
  await setEvents();
};




describe('GET /lesson/events', () => {
  const getEventsUrl = '/lesson/events';
  beforeEach(addDummyData);
  
  it('should return validation error if the lesson_id is missing in query', (done) => {
    request(app)
      .get(getEventsUrl)
      .query({})
      .expect(400)
      .end(done);
  });

  it('should return validation error if the lesson_id in query is invalid', (done) => {
    request(app)
      .get(getEventsUrl)
      .query({lesson_id: "148648451"})
      .expect(400)
      .end(done);
  });

  it('should return not found error if a lesson with the given lesson_id in query does not exist', (done) => {
    request(app)
      .get(getEventsUrl)
      .query({lesson_id: invalid_id.toString()})
      .expect(404)
      .end(done);
  });

  it('should return all events of the lesson with the given lesson_id with the status code 200', (done) => {
    request(app)
      .get(getEventsUrl)
      .query({lesson_id: lesson_ids[0].toString()})
      .expect((res) => {
        expect(res.body.events).not.toBeNull();
        expect(res.body.events).not.toBeUndefined();
        expect(res.body.events).toHaveLength(2);
        const firstEvent = res.body.events[0];
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

  it('should return all events of the lesson with the given lesson_id with the status code 200', (done) => {
    request(app)
      .get(getEventsUrl)
      .query({lesson_id: lesson_ids[1].toString()})
      .expect((res) => {
        expect(res.body.events).not.toBeNull();
        expect(res.body.events).not.toBeUndefined();
        expect(res.body.events).toHaveLength(1);
        const firstEvent = res.body.events[0];
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
  await Category.findByIdAndDelete(category._id);
  await Lesson.deleteMany({ _id: { $in: lesson_ids } });
  await User.deleteMany({ _id: {$in: user_ids}});
  await Event.deleteMany({ _id: {$in: event_ids}});
});