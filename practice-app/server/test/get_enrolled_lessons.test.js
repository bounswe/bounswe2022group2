import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, User, Lesson } from '../src/models/index.js';
import app from './../src/app.js';

const categoryId = mongoose.Types.ObjectId();
const lesson_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const lecturer_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
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
        enrolledLessons: [lesson_ids[0], lesson_ids[1]],
        attendedEvents: []
    },
    {
        _id: user_ids[1],
        email: "user2@gmail.com",
        password: "password2",
        name: "username2",
        enrolledLessons: [lesson_ids[0]],
        attendedEvents: []
    }
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

const addDummyData = async () => {
  await setCategory();
  await setLessons();
  await setUsers();
};


describe('GET /user/enrolled', () => {
  const getEnrolledLessonsUrl = '/user/enrolled';
  beforeEach(addDummyData);
  
  it('should return validation error if the user_id is missing in query', (done) => {
    request(app)
      .get(getEnrolledLessonsUrl)
      .query({})
      .expect(400)
      .end(done);
  });

  it('should return validation error if the user_id in query is invalid', (done) => {
    request(app)
      .get(getEnrolledLessonsUrl)
      .query({user_id: "148648451"})
      .expect(400)
      .end(done);
  });

  it('should return not found error if a user with the given user_id in query does not exist', (done) => {
    request(app)
      .get(getEnrolledLessonsUrl)
      .query({user_id: invalid_id.toString()})
      .expect(404)
      .end(done);
  });

  it('should return all enrolled lessons of the user with the given user_id with the status code 200', (done) => {
    request(app)
      .get(getEnrolledLessonsUrl)
      .query({user_id: user_ids[0].toString()})
      .expect((res) => {
        expect(res.body.lessons).not.toBeNull();
        expect(res.body.lessons).not.toBeUndefined();
        expect(res.body.lessons).toHaveLength(2);
        const firstLesson = res.body.lessons[0];
        expect(firstLesson).not.toBeNull();
        expect(firstLesson).not.toBeUndefined();
        expect(firstLesson.name).not.toBeNull();
        expect(firstLesson.name).not.toBeUndefined();
        expect(firstLesson.category_id).not.toBeNull();
        expect(firstLesson.category_id).not.toBeUndefined();
        expect(firstLesson.lecturer).not.toBeNull();
        expect(firstLesson.lecturer).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });

  it('should return all enrolled lessons of the user with the given user_id with the status code 200', (done) => {
    request(app)
      .get(getEnrolledLessonsUrl)
      .query({user_id: user_ids[1].toString()})
      .expect((res) => {
        expect(res.body.lessons).not.toBeNull();
        expect(res.body.lessons).not.toBeUndefined();
        expect(res.body.lessons).toHaveLength(1);
        const firstLesson = res.body.lessons[0];
        expect(firstLesson).not.toBeNull();
        expect(firstLesson).not.toBeUndefined();
        expect(firstLesson.name).not.toBeNull();
        expect(firstLesson.name).not.toBeUndefined();
        expect(firstLesson.category_id).not.toBeNull();
        expect(firstLesson.category_id).not.toBeUndefined();
        expect(firstLesson.lecturer).not.toBeNull();
        expect(firstLesson.lecturer).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
  
});

afterEach(async () => {
  await Category.findByIdAndDelete(category._id);
  await Lesson.deleteMany({ _id: { $in: lesson_ids } });
  await User.deleteMany({ _id: {$in: user_ids}});
});