import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../src/models/index.js';
import app from './../src/app.js';

const id1 = mongoose.Types.ObjectId();
const id2 = mongoose.Types.ObjectId();
const users = [
  {
    _id: id1,
    email: "hasan@gmail.com",
    password: "user1pass",
    name: "hasan",
  },
  {
    _id: id2,
    email: "ahmet@gmail.com",
    password: "user2pass",
    name: "ahmet",
  },
];

const addDummyUsers = (dummyDone) => {
  User.deleteMany({}).then(() => {
    const firstUser = new User(users[0]).save();
    const secondUser = new User(users[1]).save();

    return Promise.all([firstUser, secondUser])
  }).then(() => dummyDone());
};

beforeEach(addDummyUsers);

describe('POST /user/signup', () => {
  const signupUrl = '/user/signup';

  it('should return validation errors if the request body is not valid', (done) => {
    request(app)
      .post(signupUrl)
      .send({
        email: "random email",
        password: "123 random password",
      })
      .expect(400)
      .end(done);
  });

  it('should not create a new user if the email already exists', (done) => {
    request(app)
      .post(signupUrl)
      .send({
        email: users[0].email,
        password: "123456",
        name: "Example"
      })
      .expect(409)
      .end(done);
  });

  it('should sign up a user', (done) => {
    const email = "example@gmail.com";
    const password = "examplepassword123";
    const name = "example name";

    request(app)
      .post(signupUrl)
      .send({ email, password, name })
      .expect((res) => {
        expect(res.headers['x-auth']).not.toBeNull();
        expect(res.body.user).not.toBeNull();
        const user = res.body.user;
        expect(user.id).not.toBeNull();
        expect(user.email).toBe(email);
        expect(user.name).toBe(name);
      })
      .end(async (err) => {
        if (err) return done(err);
        await User.findOne({ email }).then((user) => {
          expect(user).not.toBeNull();
          expect(user.password).not.toBe(password);
          done();
        });
      });
  });
});