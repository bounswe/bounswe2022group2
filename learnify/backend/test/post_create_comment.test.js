import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { LearningSpace, User } from '../models/index.js';
import app from '../app.js';
import jwt from "jsonwebtoken";
import sinon from 'sinon';


const id_LS = mongoose.Types.ObjectId();
const id_POST = mongoose.Types.ObjectId();

const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjM1YWNiMWNiYjgxNzliOTUzZDVmNDFkIiwiZW1haWwiOiJoc25jYW5lcm9sQGdtYWlsLmNvbSIsInVzZXJuYW1lIjoiaGFzYW5jYW4xMTIzIiwiaWF0IjoxNjcxNjE3Njc1LCJleHAiOjE2NzE3MDQwNzV9.xWNlM4lw2O6OkqsPzACp_I9IrTNx3LkUEZGU1stXPAc";
const ls = 
  {
    _id: id_LS,
    title: "Cake Making 302",
    description: "Cake Making 302",
    num_participants: 1,
    icon_id: 4,
    categories:["Gastronomy and Culinary"],
    creator:"hasancan1123",
    admins:[],
    posts: [
      {
          title: "Post The First",
          creator: "hasancan1123",
          content: "This is first post for the cake making 302.",
          annotations: [],
          images: [""],
          comments: [],
          _id: id_POST
      }
  ],
    participants:["hasancan1123"]
  };
 

  const addDummyLS = (dummyDone) => {
    LearningSpace.deleteMany({ _id: id_LS }).then(() => {
      const dummyls = new LearningSpace(ls).save();
      return Promise.all([dummyls])
    }).then(() => dummyDone());
  };
  


describe('POST /learningspace/comment', () => {
  const url = '/learningspace/comment';
  beforeEach(addDummyLS);



  it('should return 400 when post_id is missing', (done) => {
      const ls_id= id_LS;
      const post_id = id_POST;
      const content= "description";
      const username = "hasancan1123"
    

    request(app)
      .post(url)
      .set('Authorization', token)
      .send({content, ls_id}) //post_id is missing
      .expect(400)
      .end(done);
      });


      it('should return 400 when content is missing', (done) => {
        const ls_id= id_LS;
        const post_id = id_POST;
        const content= "description";
        const username = "hasancan1123"
  

      request(app)
        .post(url)
        .set('Authorization', token)
        .send({post_id, ls_id}) //content is missing
        .expect(400)
        .end(done);
        });

        it('should return 400 when ls_id is missing', (done) => {
            const ls_id= id_LS;
            const post_id = id_POST;
            const content= "description";
            const username = "hasancan1123"
      
          sinon.stub(jwt, "decode")
          .onFirstCall().resolves(
            {username}
          );
          request(app)
            .post(url)
            .set('Authorization', token)
            .send({post_id, content}) //ls_id is missing
            .expect(400)
            .end(done);
            });

        it('should return 404 when post_id is wrong', (done) => {
            const ls_id= id_LS;
            const post_id = "63a406f5de181836cdd86227";
            const content= "description";
            const username = "hasancan1123"
          request(app)
            .post(url)
            .set('Authorization', token)
            .send({content, ls_id, post_id}) 
            .expect(404)
            .end(done);
            });
    


  it('should create the comment', (done) => {
      const post_id = id_POST;
      const content= "description";    
      const username = "hasancan1123"
      const ls_id = id_LS;

    request(app)
      .post(url)
      .set('Authorization', token)
      .send({ post_id, content, ls_id })
      .expect(200)
      .end(async (err) => {
        if (err) return done(err);
      await LearningSpace.findOne({ _id: ls_id }).then((ls) => {
        const post = ls.posts.find(element => element.post_id = post_id);
        const comment = post.comments.find(element => element.content = content)
        expect(comment.content).toBe(content);
        expect(comment.creator).toBe(username);
        done();
      });
    });
  });

});
afterEach(() => {
    sinon.restore();
});