import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../src/models/index.js';
import app from './../src/app.js';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const emailList = ["hasan@gmail.com", "ahmet@gmail.com", "example@gmail.com"];
const users = [
  {
    _id: ids[0],
    email: emailList[0],
    password: "user1pass",
    name: "hasan",
  },
  {
    _id: ids[1],
    email: emailList[1],
    password: "user2pass",
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


describe('POST /user/signup', () => {
  const signupUrl = '/user/signup';
  beforeEach(addDummyUsers);

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
    const email = emailList[2];
    const password = "examplepassword123";
    const name = "example name";

    request(app)
      .post(signupUrl)
      .send({ email, password, name })
      .expect((res) => {
        expect(res.headers['x-auth']).not.toBeNull();
        expect(res.body.user).not.toBeNull();
        expect(res.body.user).not.toBeUndefined();
        const user = res.body.user;
        expect(user.id).not.toBeNull();
        expect(user.id).not.toBeUndefined();
        expect(user.email).toBe(email);
        expect(user.name).toBe(name);
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