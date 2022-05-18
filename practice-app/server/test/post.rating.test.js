import { expect } from 'expect';
import request from 'supertest';
import sinon from 'sinon';
import app from '../src/app.js'; 
import { Rating } from '../src/models/index.js';
import { Lesson } from '../src/models/index.js';

const mockRating = {
  "lessonID": "62815d7535b0cdc89d74ab1a",
  "rating": "2.5"
}
const mockHexRating = {
  "lessonID": "62815d7535b0cdc89d74ab1r",
  "rating": "2.5"
}
const trueRating = {
  "lessonID": "62815d7535b0cdc89d74ab1e",
  "rating": "2.5"
}

describe('POST/rating', () => {

  const ratingUrl = "/rating";

  afterEach(function () {
    sinon.restore();
  });
  
  it('should add rating when the LessonID is valid', (done) => {

    sinon.stub(Rating.prototype, "save")
      .onFirstCall().resolves(
        new Rating({
          lessonID: trueRating.lessonID,
          rating: trueRating.rating
        })
      );

    sinon.stub(Rating, "findById")
      .onFirstCall().resolves(
        [
          {
            "lessonID":trueRating.lessonID
          }
        ]
      );
    sinon.stub(Lesson, "findById")
      .onFirstCall().resolves(
        [
          {
            "lessonID":trueRating.lessonID
          }
        ]
      );

    request(app)
      .post(ratingUrl)
      .send({
        lessonID: trueRating.lessonID,
        rating: trueRating.rating
      })
      .expect((res) => {
        expect(res.status).toBe(200);
        expect(res.body.resultMessage).toMatch(/successfully created/);
        expect(res.body.rating.rating == trueRating.rating);
      })
      .end(done);
  });


      
      it('should return 400 and error message when an ID is not a valid Mongoose Object ID', (done) => {
        sinon.stub(Rating, "findById")
        .onFirstCall().resolves(
        new Error()
      );
      request(app)
      .post(ratingUrl)
      .send({
        lessonID: mockHexRating.lessonID,
        rating: mockHexRating.rating
      })
      .expect((res) => {
        expect(res.status).toBe(400);
        expect(res.body.resultMessage).toMatch(/cannot exist./);
        
      })
      .end(done);
    });
      it('should return 404 and error message when Lesson does not exist', (done) => {
        sinon.stub(Rating, "findById")
        .onFirstCall().resolves(
        []
      );
      request(app)
      .post(ratingUrl)
      .send({
        lessonID: mockRating.lessonID,
        rating: mockRating.rating
      })
      .expect((res) => {
        expect(res.status).toBe(404);
        expect(res.body.resultMessage).toMatch(/does not exist./);
        
      })
      .end(done);
    });
    });

