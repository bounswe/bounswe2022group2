import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, Lesson } from '../src/models/index.js';
import app from './../src/app.js';
import bcrypt from 'bcryptjs';

const { hash } = bcrypt;
const categoryId = mongoose.Types.ObjectId();
const lessonIds = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const userIds = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const emailList = ["hasan@gmail.com", "ahmet@gmail.com"];
const user0password = await hash("user0pass", 10);
const user1password = await hash("user1pass", 10);


const lecturers = [
  {
    _id: userIds[0],
    email: emailList[0],
    password: user0password,
    name: "hasan",
  },
  {
    _id: userIds[1],
    email: emailList[1],
    password: user1password,
    name: "ahmet",
  },
];

const category = {
  _id: categoryId,
  title: "Sport",
  description: "mockDescription"
};

const lessons = [
  {
    _id: lessonIds[0],
    name: "Tennis",
    category_id: category._id,
    lecturer: lecturers[0]
  },
  {
    _id: lessonIds[1],
    name: "Volleyball",
    category_id: category._id,
    lecturer: lecturers[1]
  },
];

const addDummyData = (dummyDone) => {
    Lesson.deleteMany({_id: {$in: lessonIds}}).then(() => {
        const firstLecture = new Lesson(lessons[0]).save();
        const secondLecture = new Lesson(lessons[1]).save();
        return Promise.all([firstLecture, secondLecture])
    }).then(() => dummyDone());
};

describe('GET /lesson/byName', () => {
  const byNameUrl = '/lesson/byName';
  beforeEach(addDummyData);

  it('should return validation error if the query parameter is not valid', (done) => {
    request(app)
      .get(byNameUrl)
      .query({ name: null })
      .expect(400)
      .end(done);
  });

  it('should return all lessons with the given name', (done) => {
    request(app)
      .get(byNameUrl)
      .query({ name: "Tennis" })
      .expect((res) => {
        expect(res.body.lessons).not.toBeNull();
        expect(res.body.lessons).not.toBeUndefined();
        expect(res.body.lessons).toHaveLength(1);
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
