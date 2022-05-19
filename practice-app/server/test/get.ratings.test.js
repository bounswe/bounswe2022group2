import { expect } from 'expect';
import request from 'supertest';
import sinon from 'sinon';
import app from './../src/app.js';
import { Rating } from '../src/models/index.js';


const interval = {
  min: "2",
  max: "8"
}

const mockRatings = [
  {
    lessonId: "ece",
    rating: "2",
  },
  {
    lessonID: "eae",
    rating: "7",
   
  },
];



describe('GET /rating', () => {
  const ratingUrl = `/rating?min=${interval.min}&max=${interval.max}`;
  const dummyRatingUrl = `/rating?min=${interval.min}`;
  afterEach(function () {
    sinon.restore();
});
it(`should return ratings between ${interval.min} and ${interval.max}`, (done) => {
    sinon.stub(Rating, "find")
        .onFirstCall().resolves(
            mockRatings
        );
    
    request(app)
        .get(ratingUrl)
        .expect((res) => {
            expect(res.status).toBe(200);
            expect(res.body).toEqual(mockRatings);
    
        })
        .end(done);
});
it(`should return 400 Bad Request when min or max interval is missing`, (done) => {
    sinon.stub(Rating, "find")
        .onFirstCall().resolves(
            []
        );
    
    request(app)
        .get(dummyRatingUrl)
        .expect((res) => {
            expect(res.status).toBe(400);
            expect(res.body.resultMessage).toMatch(/required/);
    
        })
        .end(done);
});
});