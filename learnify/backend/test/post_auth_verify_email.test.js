import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../models/index.js';
import app from '../app.js';
import sinon from 'sinon';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const emailList = ["vojtos.18@gmail.com", "ecenur@gmail.com"];
const users = [
  {
    _id: ids[0],
    email: emailList[0],
    username: "valion",
    password: "123434",
    verification_code:"12345",
    is_verified:"false"
  },
  {
    _id: ids[1],
    email: emailList[1],
    username: "ecenur",
    password: "123434",
    verification_code:"ece12345",
    is_verified:"false"
  },
];

const addDummyUsers = (dummyDone) => {
  User.deleteMany({ email: { $in: emailList } }).then(() => {
    const firstUser = new User(users[0]).save();
    const secondUser = new User(users[1]).save();
    return Promise.all([firstUser, secondUser])
  }).then(() => dummyDone());
};


describe('POST /auth/verifyEmail', () => {


    const verifyEmailUrl = '/auth/verifyEmail';

    beforeEach(addDummyUsers);
    afterEach(function () {
        sinon.restore();
        User.deleteMany({ email: { $in: emailList } })
      });

    it('should return validation errors if the request body is not valid', (done) => {
        request(app)
          .post(verifyEmailUrl)
          .send({
            email: "thisisnotanemail",
          })
          .expect(400)
          .end(done);
      });

    it('should return user does not exist if the user with given email does not exist', (done) => {
    request(app)
        .post(verifyEmailUrl)
        .send({
        email: "ecen@gmail.com",
        code: "123456"
        })
        .expect(404)
        .end(done);
    });
    
    it('should return wrong code if the code does not match', (done) => {
    request(app)
        .post(verifyEmailUrl)
        .send({
        email: "vojtos.18@gmail.com",
        code: "123456ece",
        })
        .expect(400)
        .end(done);
    });

    it('should verify the user if code matches and user exists', (done) => {
        request(app)
            .post(verifyEmailUrl)
            .send({
            email: "vojtos.18@gmail.com",
            code: "12345",
            })
            .expect(200)
            .end(done);
        });
    
        const user = User.exists({ email: "vojtos.18@gmail.com"})
        .then((user) => {
          expect(user.is_verified);
        });
})