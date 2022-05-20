import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../src/models/index.js';
import app from './../src/app.js';
import bcrypt from 'bcryptjs';

const { hash } = bcrypt;
const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const emailList = ["hasan@gmail.com", "ahmet@gmail.com", "example@gmail.com"];
const user0password = await hash("user0pass", 10);
const user1password = await hash("user1pass", 10);
const users = [
  {
    _id: ids[0],
    email: emailList[0],
    password: user0password,
    name: "hasan",
  },
  {
    _id: ids[1],
    email: emailList[1],
    password: user1password,
    name: "ahmet",
  },
];

const addDummyUsers = (dummyDone) => {
  User.deleteMany({ email: { $in: emailList } }).then(() => {
    const firstUser = new User(users[0]).save();
    const secondUser = new User(users[1]).save();
    return Promise.all([firstUser, secondUser])
  }).then(() => dummyDone());
};


describe('POST /user/login', () => {
  const loginUrl = '/user/login';
  beforeEach(addDummyUsers);

  it('should return validation errors if the request body is not valid', (done) => {
    let email = "random email";
    request(app)
      .post(loginUrl)
      .send({ email })
      .expect(400)
      .end(done);
  });

  it('should return error if there is no user with the given email', (done) => {
    let email = emailList[2];
    let password = "123456";
    request(app)
      .post(loginUrl)
      .send({ email, password })
      .expect(404)
      .end(done);
  });

  it('should not login user if the password is incorrect', (done) => {
    let email = users[0].email;
    let password = "notcorrect";
    request(app)
      .post(loginUrl)
      .send({ email, password })
      .expect(409)
      .end(done);
  });

  it('should login registered user', (done) => {
    const email = emailList[0];
    const password = "user0pass";

    request(app)
      .post(loginUrl)
      .send({ email, password })
      .expect((res) => {
        expect(res.headers['x-auth']).not.toBeNull();
        expect(res.body.user).not.toBeNull();
        expect(res.body.user).not.toBeUndefined();
        const user = res.body.user;
        expect(user.id).not.toBeNull();
        expect(user.id).not.toBeUndefined();
        expect(user.email).toBe(email);
        expect(res.status).toBe(200);
      })
      .end(async (err) => {
        if (err) return done(err);
        await User.findOne({ email }).then((user) => {
            expect(user).not.toBeNull();
            expect(user).not.toBeUndefined();
            expect(user.password).not.toBe(password);
            done();
        });
      });
  });
});

afterEach(() => User.deleteMany({ email: { $in: emailList } }));