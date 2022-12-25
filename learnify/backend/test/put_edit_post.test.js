import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { LearningSpace, User } from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";
import sinon from 'sinon';


const id = mongoose.Types.ObjectId();
const post_id = mongoose.Types.ObjectId();
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjM4OGE4ODc1NjMwNjc2ZDEzNDM3M2YyIiwiZW1haWwiOiJlZ29sZGZlcmJAZ21haWwuY29tIiwidXNlcm5hbWUiOiJlY2VudXIiLCJpYXQiOjE2NzAyNzQ3MTQsImV4cCI6MTY3MDM2MTExNH0.xgdgXLWB8_pqbQpf7wN2t4VucLsYLm65jwxPieorqvU";
const post = {
  _id: post_id,
  title: "Post by Ece",
  creator: "ecenur",
  content: "ece's useless post",
  images: []
};
const ls =
{
  _id: id,
  title: "Künefe Making",
  description: "You can easily learn about the hardest desert on earth",
  num_participants: 1,
  icon_id: 4,
  categories: ["Gastronomy and Culinary"],
  creator: "ecenur",
  admins: [],
  posts: [post],
  participants: ["ecenur"]
};


const addDummyLS = (dummyDone) => {
  LearningSpace.deleteMany({ _id: id }).then(() => {
    const dummyls = new LearningSpace(ls).save();
    return Promise.all([dummyls])
  }).then(() => dummyDone());
};



describe('POST /learningspace/edit/post', () => {
  const url = '/learningspace/edit/post';
  beforeEach(addDummyLS);


  it('should return 400 when post_id is missing', (done) => {
    const ls_id = String(id);

    request(app)
      .put(url)
      .set('Authorization', token)
      .send({
        "title": "title1",
        "ls_id": ls_id,
      }) //post_id is missing
      .expect(400)
      .end(done);
  });


  it('should return 400 when ls_id is missing', (done) => {
    const title = "title1";
    const content = "description1";
    request(app)
      .put(url)
      .set('Authorization', token)
      .send({ title, content, post_id }) //ls_id is missing
      .expect(400)
      .end(done);
  });


  it('should return 404 when ls_id is wrong', (done) => {
    const ls_id = "6388aa434b7adf2246b2da7f";
    const title = "title1";
    const content = "description1";
    request(app)
      .post(url)
      .set('Authorization', token)
      .send({ content, ls_id, title })
      .expect(404)
      .end(done);
  });

  it('should return 404 when post_id is wrong', (done) => {
    const ls_id = id;
    const post_id = "6388aa434b7adf2246b2da7f";
    const title = "title1";
    const content = "description1";
    request(app)
      .put(url)
      .set('Authorization', token)
      .send({ content, ls_id, title, post_id })
      .expect(404)
      .end(done);
  });



  it('should create the endpoint', (done) => {
    const title = "title1";
    const content = "description1";
    const username = "ecenur"
    const ls_id = id;

    request(app)
      .put(url)
      .set('Authorization', token)
      .send({ title, content, ls_id, post_id })
      .expect(200)
      .end(async (err) => {
        if (err) return done(err);
        await LearningSpace.findOne({ _id: ls_id }).then((ls) => {
          const post = ls.posts.find(element => element.title = title);
          expect(post.title).toBe(title);
          expect(post.content).toBe(content);
          expect(post.creator).toBe(username);
          done();
        });
      });
  });

});
afterEach(() => {
  sinon.restore();
});