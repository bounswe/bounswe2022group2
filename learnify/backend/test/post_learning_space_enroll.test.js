import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import jwt from "jsonwebtoken";
import { LearningSpace, User } from '../models/index.js';
import app from '../app.js';
import sinon from 'sinon';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjM4OGE4ODc1NjMwNjc2ZDEzNDM3M2YyIiwiZW1haWwiOiJlZ29sZGZlcmJAZ21haWwuY29tIiwidXNlcm5hbWUiOiJlY2VudXIiLCJpYXQiOjE2NzAyNzQ3MTQsImV4cCI6MTY3MDM2MTExNH0.xgdgXLWB8_pqbQpf7wN2t4VucLsYLm65jwxPieorqvU";
const learningSpace = 
  {
    _id: ids[0],
    title: "Math with Astrology",
    description:"ecececece",
    creator:"ecenur",
    participants: [],
    num_participants: 1,
  };
const user =
{
    _id: ids[1],
    email: "e@gmail.com",
    username: "ecenurke",
    password: "123434",
    verification_code:"ece12345",
    is_verified:"false"
  };

  const addDummyUser = (dummyDone) => {
    User.deleteMany({ email: user.email }).then(() => {
      const firstUser = new User(user).save();
      return Promise.all([firstUser])
    }).then(() => dummyDone());
  };

  const addDummyLS = (dummyDone) => {
    LearningSpace.deleteMany({ title: learningSpace.title}).then(() => {
      const firstLS = new LearningSpace(learningSpace).save();
      return Promise.all([firstLS])
    }).then(() => dummyDone());
  };



describe('POST /learningspace/enroll', () => {
  const url = '/learningspace/enroll';
    
  beforeEach(addDummyUser);
  beforeEach(addDummyLS);
  afterEach(function () {
      sinon.restore();
      User.deleteMany({ email:  user.email  });
      LearningSpace.deleteMany({title: learningSpace.title});
    });

  it('should return 400 when title is missing', (done) => {
    const username = "username"
    request(app)
      .post(url)
      .set({ Authorization: token })
      .send({}) //title is missing
      .expect(400)
      .end(async (err) => {
        if (err) return done(err);
        });

        done();
      });


  it('should return 401 when auth header is missing', (done) => {
    const title = "title1";   
  request(app)
    .post(url)
    .set({  })  //authorization is missing
    .send({title})
    .expect(401)
    .end(async (err) => {
      if (err) return done(err);
      });
      done();
    });

    it('should return 409 when learning space with given title does not exist', (done) => {
      const title = "title1";      
      const username = "ecenurke"
    request(app)
      .post(url)
      .set({ Authorization: token })
      .send({title})
      .expect(409)
      .end(async (err) => {
        if (err) return done(err);
        });
        done();
      });

    it('should return 409 when the user with given username does not exist', (done) => {
      const title = "Math with Astrology";      
      const dummyToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjM4OGE4ODc1NjMwNjc2ZDEzNDM3M2YyIiwiZW1haWwiOiJlZ29sZGZlcmJAZ21haWwuY29tIiwidXNlcm5hbWUiOiJlY2VudXJrZWsiLCJpYXQiOjE2NzAyNzQ3MTQsImV4cCI6MTY3MDM2MTExNH0.vEsNc6lLTxc4WFTaG7s2weOPqe_-eXlXYafi7xEZn8o"; 
      request(app)
      .post(url)
      .set({ Authorization: dummyToken })
      .send({title})
      .expect(409)
      .end(async (err) => {
        if (err) return done(err);
        });
      });


  it('should create the endpoint', (done) => {
      const title = "Math with Astrology";       

    request(app)
      .post(url)
      .set({ Authorization: token })
      .send({ title:title})
      .expect(200)
      .end(done);
    });

      LearningSpace.findOne({ title: "Math with Astrology" }).then((ls) => {
        expect(ls.title).toBe("Math with Astrology");
        expect(ls.participants.includes("ecenurke")).toBe(true);
        expect(ls.num_participants == 2).toBe(true);
        done();
      });

});