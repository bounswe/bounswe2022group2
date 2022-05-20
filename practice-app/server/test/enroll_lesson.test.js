import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, Lesson, User } from '../src/models/index.js';
import app from './../src/app.js';

const categoryId = mongoose.Types.ObjectId();
const lesson_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const user_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const invalid_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];

const category = {
  _id: categoryId,
  title: "Category1",
  description: "Description1",
}

const lessons = [
  {
    _id: lesson_ids[0],
    name: "Lesson1",
    category_id: category._id
  },
  {
    _id: lesson_ids[1],
    name: "Lesson2",
    category_id: category._id
  },
  {
    _id: lesson_ids[2],
    name: "Lesson3",
    category_id: category._id
  },
  {
    _id: lesson_ids[3],
    name: "Lesson3",
    category_id: category._id
  }
];

const users = [
    {
        _id: user_ids[0],
        email: "user1@gmail.com",
        password: "password1",
        name: "username1",
        enrolledLessons: [lesson_ids[0],lesson_ids[1],lesson_ids[2]]
    },
    {
        _id: user_ids[1],
        email: "user2@gmail.com",
        password: "password2",
        name: "username2",
        enrolledLessons: [lesson_ids[1],lesson_ids[2]]
    }
]

const setCategory = async () => {
  await new Category(category).save();
}

const setLessons = async () => {
  await new Lesson(lessons[0]).save();
  await new Lesson(lessons[1]).save();
  await new Lesson(lessons[2]).save();
  await new Lesson(lessons[3]).save();
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

  describe('POST /user/enroll', () => {
    const enrollUrl = '/user/enroll';
    beforeEach(addDummyData);
    
    it('should return validation error if the user_id is missing in body', (done) => {
      request(app)
        .post(enrollUrl)
        .send({lesson_id: lesson_ids[0]})
        .expect(400)
        .end(done);
    });
  
    it('should return validation error if the lesson_id is missing in body', (done) => {
      request(app)
        .post(enrollUrl)
        .send({user_id: user_ids[0]})
        .expect(400)
        .end(done);
    });
  
    it('should return validation error if the user_id is invalid in body', (done) => {
      request(app)
        .post(enrollUrl)
        .send({
          user_id: "id",  
          lesson_id: lesson_ids[0]
         })
        .expect(400)
        .end(done);
    });
  
    it('should return validation error if the lesson_id is invalid in body', (done) => {
      request(app)
        .post(enrollUrl)
        .send({
          user_id: user_ids[0],  
          lesson_id: "55444645161"
         })
        .expect(400)
        .end(done);
    });
  
    it('should return not found error if the user with the given user_id does not exist', (done) => {
      request(app)
        .post(enrollUrl)
        .send({
          user_id: invalid_ids[0],  
          lesson_id: lesson_ids[0]
         })
        .expect(404)
        .end(done);
    });
  
    it('should return not found error if the lesson with the given lesson_id does not exist', (done) => {
      request(app)
        .post(enrollUrl)
        .send({
          user_id: user_ids[0],  
          lesson_id: invalid_ids[1]
         })
        .expect(404)
        .end(done);
    });
  
    it('should return not found error if the user with the given user_id does take the lesson with the given lesson_id', (done) => {
      request(app)
        .post(enrollUrl)
        .send({
          user_id: user_ids[0],  
          lesson_id: lesson_ids[0]
         })
        .expect(404)
        .end(done);
    });
  
    it('should return the user with the given user_id with updated enrolledLessons list and added lesson with the given lesson_id', (done) => {
  
      request(app)
        .post(enrollUrl)
        .send({ user_id: user_ids[1], lesson_id: lesson_ids[0] })
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
          expect(res.body.lesson).not.toBeNull();
          expect(res.body.lesson).not.toBeUndefined();
          expect(res.body.lesson.id).not.toBeNull();
          expect(res.body.lesson.id).not.toBeUndefined();
          const firstLesson = res.body.user.enrolledLessons[0];
          expect(firstLesson).not.toBeNull();
          expect(firstLesson).not.toBeUndefined();
          expect(res.statusCode).toBe(200);
        })
        .end(done);
    });
    
    it('should return the user with the given user_id with updated enrolledLessons list and added lesson with the given lesson_id', (done) => {
  
      request(app)
        .post(enrollUrl)
        .send({ user_id: user_ids[1], lesson_id: lesson_ids[3] })
        .expect((res) => {
          expect(res.body.user).not.toBeNull();
          expect(res.body.user).not.toBeUndefined();
          expect(res.body.user.email).not.toBeNull();
          expect(res.body.user.email).not.toBeUndefined();
          expect(res.body.user.name).not.toBeNull();
          expect(res.body.user.name).not.toBeUndefined();
          expect(res.body.user.enrolledLessons).not.toBeNull();
          expect(res.body.user.enrolledLessons).not.toBeUndefined();
          expect(res.body.user.enrolledLessons).toHaveLength(1);
          expect(res.body.lesson).not.toBeNull();
          expect(res.body.lesson).not.toBeUndefined();
          expect(res.body.lesson.id).not.toBeNull();
          expect(res.body.lesson.id).not.toBeUndefined();
          const firstLesson = res.body.user.enrolledLessons[0];
          expect(firstLesson).not.toBeNull();
          expect(firstLesson).not.toBeUndefined();
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
