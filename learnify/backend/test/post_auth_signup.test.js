import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../models/index.js';
import app from '../app.js';
import sinon from 'sinon';
import  send_verification_email from '../utils/auth/send_verification_email.js' 

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const emailList = ["batu@gmail.com", "example@gmail.com"];
const users = [
  {
    _id: ids[0],
    email: emailList[0],
    password: "user1pass",
    username: "batu",
  },
  {
    _id: ids[1],
    email: emailList[1],
    password: "user2pass",
    username: "ahmet",
  },
];

const addDummyUsers = (dummyDone) => {
  User.deleteMany({ email: { $in: emailList } }).then(() => {
    const firstUser = new User(users[0]).save();
    const secondUser = new User(users[1]).save();
    return Promise.all([firstUser, secondUser])
  }).then(() => dummyDone());
};


describe('POST /auth/signup', () => {


    const signupUrl = '/auth/signup';

    beforeEach(addDummyUsers);
    afterEach(function () {
        sinon.restore();
        User.deleteMany({ email: { $in: emailList } })
      });

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
        username: "Example"
        })
        .expect(409)
        .end(done);
    });
    
    it('should not create a new user if the username already exists', (done) => {
    request(app)
        .post(signupUrl)
        .send({
        email: "batu@gmail.com",
        password: "123456",
        username: "batu"
        })
        .expect(409)
        .end(done);
    });

    it('should create a new user if input has no problems', (done) => {

      sinon.mock(send_verification_email, () => ({
        ...sinon.requireActual(send_verification_email),
        __esModule: true,
        default: sinon.fn(),
      }));

        request(app)
            .post(signupUrl)
            .send({
            email: "b@b.com",
            password: "123456",
            username: "Example"
            })
            .expect(200)
            .end(done);
        });

        const user = User.exists({ email: "b@b.com"})
        .then((user) => {
          expect(user.username).toBe("Example");
          expect(user.password).not("123456");
          expect(user.is_verified).not(true);
        });
    
})