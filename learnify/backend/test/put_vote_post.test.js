import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { User } from '../models/index.js';
import app from '../app.js';
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
        "title": "Step 2. Sanitize Everything",
        "creator": "ecenur",
        "content": "Everything the beer touches (bucket, siphon, bottling wand, bottles) should be sanitized before you use it and definitely before you begin the bottling process. Don’t slack off here, else your beer could pick up flavors you don't want.",
        "upvote": 4,
        "downvote": 2,
        "images": [
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


describe('POST /learningspace/post/vote', () => {


    const url = '/learningspace/post/vote';

    beforeEach(addLS);
  

    it('should return validation error when body missing', (done) => {
        request(app)
          .put(url)
          .set('Authorization', token)
          .send({
            post_id:ls.posts[0].id,
            type:"upvote"
        })
          .expect(400)
          .end(done);
      });

    it('should return learning space does not exist if the LS with given id does not exist', (done) => {
    request(app)
        .put(url)
        .set('Authorization', token)
        .send({
            ls_id:"6390e36e318d2203c41cf312",
            post_id:ls.posts[0].id,
            type:"upvote"
        })
        .expect(400)
        .end(done);
    });
    
    it('should return internal server error if the sent ids are not Mongo Object IDs', (done) => {
    request(app)
        .put(url)
        .set('Authorization', token)
        .send({
            ls_id:"weirdid",
            post_id:ids[1],
            type:"upvote"
        })
        .expect(500)
        .end(done);
    });

    it('should create the endpoint', (done) => {
        request(app)
            .put(url)
            .set('Authorization', token)
            .send({
                ls_id:ids[0],
                post_id:ids[1],
                type:"upvote"
            })
            .expect(200)
            .end(done);
        });
 
})

// afterEach(() => {
    
//   });