import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, Lesson } from '../src/models/index.js';
import app from './../src/app.js';

const categoryId = mongoose.Types.ObjectId(); 
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const category = {
  _id: categoryId,
  title: "Sport",
  description: "mockDescription"
}

const lecturers = [
  {
    _id: user_ids[0],
    email: "user1@gmail.com",
    password: "password1",
    name: "username1",
    enrolledLessons: []
  },
  {
    _id: user_ids[1],
    email: "user2@gmail.com",
    password: "password2",
    name: "username2",
    enrolledLessons: []
  }
];

const lessons = [
  {
    _id: ids[0],
    name: "Tennis",
    category_id: category._id,
    lecturer: lecturers[0]._id,
  },
  {
    _id: ids[1],
    name: "Volleyball",
    category_id: category._id,
    lecturer: lecturers[1]._id,
  },
];

const setCategory = async () => {
  await new Category(category).save();
}

const setLessons = async () => {
  await new Lesson(lessons[0]).save();
  await new Lesson(lessons[1]).save();
}

const addDummyData = async () => {
  await setCategory();
  await setLessons();
};


describe('GET /lesson/byCategory', () => {
  const byCategoryUrl = '/lesson/byCategory';
  beforeEach(addDummyData);

  it('should return validation error if the query parameter is not valid', (done) => {
    request(app)
      .get(byCategoryUrl)
      .query({ category_id: '123' })
      .expect(400)
      .end(done);
  });

  it('should return all lessons with the given category', (done) => {
    request(app)
      .get(byCategoryUrl)
      .query({ category_id: categoryId.toString() })
      .expect((res) => {
        expect(res.body.lessons).not.toBeNull();
        expect(res.body.lessons).not.toBeUndefined();
        expect(res.body.lessons).toHaveLength(2);
        const firstLesson = res.body.lessons[0];
        expect(firstLesson).not.toBeNull();
        expect(firstLesson).not.toBeUndefined();
        expect(firstLesson.id).not.toBeNull();
        expect(firstLesson.id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
});

afterEach(async () => {
  await Category.findByIdAndDelete(category._id);
  await Lesson.deleteMany({ _id: { $in: ids } });
});