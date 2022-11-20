import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { LearningSpace, User } from '../models/index.js';
import app from '../app.js';
import sinon from 'sinon';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const learningSpace = 
  {
    _id: ids[0],
    title: "Math with Astrology",
    description:"ecececece",
    creator:"ecenur",
    participants: ["ecenur"],
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
      .send({username}) //title is missing
      .expect(400)
      .end(async (err) => {
        if (err) return done(err);
        });

        done();
      });


  it('should return 400 when username is missing', (done) => {
    const title = "title1";   
  request(app)
    .post(url)
    .send({title}) //username is missing
    .expect(400)
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
      .send({title, username})
      .expect(409)
      .end(async (err) => {
        if (err) return done(err);
        });
        done();
      });

    it('should return 409 when the user with given username does not exist', (done) => {
      const title = "Math with Astrology";      
      const username = "ecenurkek"
    request(app)
      .post(url)
      .send({title, username})
      .expect(409)
      .end(async (err) => {
        if (err) return done(err);
        });
        done();
      });


  it('should create the endpoint', (done) => {
      const title = "Math with Astrology";       
      const username = "ecenurke";

    request(app)
      .post(url)
      .send({ title:title, username:username })
      .expect(200)
      .end(done);
    });

      LearningSpace.findOne({ title: "Math with Astrology" }).then((ls) => {
        console.log(ls);
        expect(ls.title).toBe("Math with Astrology");
        expect(ls.participants.includes("ecenurke")).toBe(true);
        expect(ls.num_participants == 2).toBe(true);
        done();
      });

});