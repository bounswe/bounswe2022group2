import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { LearningSpace, User } from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";
import sinon from 'sinon';
import axios from "axios";

describe('POST /learningspace', () => {
  const url = '/learningspace';

  afterEach(() => { sinon.restore();})

  it('should return 400 when title is missing', (done) => {
      const title = "title1";
      const description= "description1";
      const token = "token"        
      const username = "username"

    sinon.stub(jwt, "decode")
    .onFirstCall().resolves(
      {username}
    );
    request(app)
      .post(url)
      .send({description }) //title is missing
      .set('Authorization', 'Bearer valid_token')
      .expect(400)
      .end(done);

      });


  it('should return 400 when description is missing', (done) => {
    const title = "title1";
    const description= "description1";
    const token = "token"        
    const username = "username"

  sinon.stub(jwt, "decode")
  .onFirstCall().resolves(
    {username}
  );
  request(app)
    .post(url)
    .send({title }) //title is missing
    .set('Authorization', 'Bearer valid_token')
    .expect(400)
    .end(done);

    });

    it('should return 409 when title already exists', (done) => {
      const title = "title1";
      const description= "description1";      
      const username = "username"
      const categories = ["Music", "Sports"];
  
    sinon.stub(jwt, "decode")
    .onFirstCall().resolves(
      {username}
    );
      sinon.stub(LearningSpace, "exists")
      .onFirstCall().resolves(
        true
      );
    request(app)
      .post(url)
      .set('Authorization', 'Bearer valid_token')
      .send({title, description, categories})
      .expect(409)
      .end(done);
       
      });

    it('should check for unavailable categories', (done) => {
      const title = "title1";
      const description= "description1";
      const token = "token"        
      const username = "username"
      const categories = ["Musicc", "Sps"]

    sinon.stub(jwt, "decode")
    .onFirstCall().resolves(
      {username}
    );
    request(app)
      .post(url)
      .send({ title, description, categories })
      .set('Authorization', 'Bearer valid_token')
      .expect(400).end(done);
  });


  it('should create the learningspace', (done) => {
    let r = (Math.random() + 1).toString(36).substring(7);
      const title = r + "title11";
      const description= "description1";       
      const username = r + "username";
      const categories = ["Music", "Sports"]

    sinon.stub(jwt, "decode")
    .onFirstCall().returns(
      {username}
    );
    sinon.stub(axios, "post")
    .onFirstCall().resolves(
      {username}
    );
    request(app)
      .post(url)
      .send({ title, description, categories })
      .set('Authorization', 'Bearer valid_token')
      .expect(200)
      .end(function(err, res) {
        if(err) return done(err);
        console.log(res.body.learningSpace)
        expect(res.body.learningSpace.title).toBe(title);
        expect(res.body.learningSpace.description).toBe(description);
        expect(res.body.learningSpace.creator).toBe(username)
        done();
      }) ;
  });
});