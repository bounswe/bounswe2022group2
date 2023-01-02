import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../models/index.js';
import app from '../app.js';
import sinon from 'sinon';
import LearningSpace from '../models/learning_space.js';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjM4OGE4ODc1NjMwNjc2ZDEzNDM3M2YyIiwiZW1haWwiOiJlZ29sZGZlcmJAZ21haWwuY29tIiwidXNlcm5hbWUiOiJlY2VudXIiLCJpYXQiOjE2NzAyNzQ3MTQsImV4cCI6MTY3MDM2MTExNH0.xgdgXLWB8_pqbQpf7wN2t4VucLsYLm65jwxPieorqvU";
const ls = {
    _id: ids[0],
    title: "Vine Making at Home",
    description: "vine makers get together for best!",
    num_participants: 2,
    icon_id: 4,
    categories: [
      "Lifestyle",
      "Gastronomy and Culinary"
    ],
    creator: "ecenur.sezer",
    admins: [],
    posts: [
      {
        title: "Step 2. Sanitize Everything",
        creator: "ecenur",
        content: "Everything the beer touches (bucket, siphon, bottling wand, bottles) should be sanitized before you use it and definitely before you begin the bottling process. Don’t slack off here, else your beer could pick up flavors you don't want.",
        upvote: 4,
        downvote: 2,
        images: [
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/nick-calder-scholes-head-brewer-at-one-drop-brewing-mixes-news-photo-1611244396.?crop=1xw:0.99951xh;center,top&resize=980:*"
        ],
        _id:ids[1]
      }
    ],
    participants: [
      "ecenur.sezer",
      "vojtech.vit"
    ]
  };


const addLS = (dummyDone) => {
  LearningSpace.deleteMany({ title: ls.title }).then(() => {
    const ls_saved = new LearningSpace(ls).save();
    return Promise.all([ls_saved])
  }).then(() => dummyDone());
};


describe('POST /annotations-service/create/:ls_id/:post_id', () => {


    const url = '/annotations-service/create/';

    beforeEach(addLS);
    // afterEach(function () {
    //     LearningSpace.deleteMany({ title: ls.title })
    //   });

    it('should return endpoint not found if path parameters are missing', (done) => {
        request(app)
          .post(url)
          .set('Authorization', token)
          .send({
            "@context":"http://www.w3.org/ns/anno.jsonld",
            "type":"Annotation",
            "body":"I wonder if I will make it today",
            "target":{
               "id":"https://frog-images.com/image1#xywh=100,200,150,20",
               "type":"Image",
               "format":"image/jpg"
            }
        })
          .expect(404)
          .end(done);
      });

    it('should return learning space does not exist if the LS with given id does not exist', (done) => {
    request(app)
        .post(url+`6390e36e318d2203c41cf312/${ls.posts[0].id}`)
        .set('Authorization', token)
        .send({
            "@context":"http://www.w3.org/ns/anno.jsonld",
            "type":"Annotation",
            "body":"I wonder if I will make it today",
            "target":{
               "id":"https://frog-images.com/image1#xywh=100,200,150,20",
               "type":"Image",
               "format":"image/jpg"
            }
        })
        .expect(409)
        .end(done);
    });
    
    it('should return internal server error if the sent ids are not Mongo Object IDs', (done) => {
    request(app)
        .post(url+`weirdlsid/${ls.posts[0].id}`)
        .set('Authorization', token)
        .send({
            "@context":"http://www.w3.org/ns/anno.jsonld",
            "type":"Annotation",
            "body":"I wonder if I will make it today",
            "target":{
               "id":"https://frog-images.com/image1#xywh=100,200,150,20",
               "type":"Image",
               "format":"image/jpg"
            }
        })
        .expect(500)
        .end(done);
    });

    it('should create the endpoint', (done) => {
        request(app)
            .post(url+`${String(ids[0])}/${String(ids[1])}`)
            .set('Authorization', token)
            .send({
                "@context":"http://www.w3.org/ns/anno.jsonld",
                "type":"Annotation",
                "body":"I wonder if I will make it today",
                "target":{
                   "id":"https://frog-images.com/image1#xywh=100,200,150,20",
                   "type":"Image",
                   "format":"image/jpg"
                }
            })
            .expect(200)
            .end(done);
        });

})