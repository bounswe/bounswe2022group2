import { expect } from 'expect';
import request from 'supertest';
import axios from 'axios';
import sinon from 'sinon';
import app from './../src/app.js';
import { Category } from '../src/models/index.js';

const mockCategory = {
  "title": "Calculus",
  "description": "mockDescription"
}

describe('POST /api/category', () => {

  const categoryUrl = "/category";

  afterEach(function () {
    sinon.restore();
  });
  it('should add category when the title is valid', (done) => {
    sinon.stub(axios, "get")
      .onFirstCall().resolves({
        "data": {
          "query": {
            "searchinfo": {
              "totalhits": 1564
            },
            "search": [
              {
                "title": mockCategory.title
              }
            ]
          }
        }
      })
      .onSecondCall().resolves(
        {
          "data": {
            "extract": mockCategory.description
          }
        }
      );

    sinon.stub(Category.prototype, "save")
      .onFirstCall().resolves(
        new Category({
          title: mockCategory.title,
          description: mockCategory.description
        })
      );

    sinon.stub(Category, "find")
      .onFirstCall().resolves(
        []
      );

    request(app)
      .post(categoryUrl)
      .send({
        title: mockCategory.title
      })
      .expect((res) => {
        expect(res.status).toBe(200);
        expect(res.body.resultMessage).toMatch(/successfully created/);
        expect(res.body.category.description == mockCategory.description);
      })
      .end(done);
  });

  it('should return 409 and existing category when the category already exists', (done) => {

    var spy = sinon.spy();
    sinon.stub(axios, "get")
      .onFirstCall().returns({
        "data": {
          "query": {
            "searchinfo": {
              "totalhits": 1564
            },
            "search": [
              {
                "title": mockCategory.title
              }
            ]
          }
        }
      });
    sinon.stub(Category, "find")
      .onFirstCall().resolves(
        [new Category({
          title: mockCategory.title,
          description: mockCategory.description
        })]);

    request(app)
      .post(categoryUrl)
      .send({
        title: mockCategory.title
      })
      .expect((res) => {
        expect(res.status).toBe(409);
        expect(res.body.resultMessage).toMatch(/already exists/);
        expect(res.body.category.description == mockCategory.description);
      })
      .end(done);
  });
  it('should return 202 and a suggestion when wikipedia suggest a title instead', (done) => {

    var spy = sinon.spy();
    const suggestion = "nodejs"
    sinon.stub(axios, "get")
      .onFirstCall().returns({
        "data": {
          "query": {
            "searchinfo": {
              "totalhits": 1564,
              "suggestion": suggestion
            },
            "search": []
          }
        }
      });
    request(app)
      .post(categoryUrl)
      .send({
        title: "noodjs"
      })
      .expect((res) => {
        expect(res.status).toBe(202);
        expect(res.body.resultMessage).toMatch(/mean/);
        expect(res.body.suggestion).toMatch(suggestion);
      })
      .end(done);
  });
  it('should return 400 and error message when title is too short', (done) => {
    request(app)
      .post(categoryUrl)
      .send({
        title: "a"
      })
      .expect((res) => {
        expect(res.status).toBe(400);
        expect(res.body.resultMessage).toMatch(/characters/);
      })
      .end(done);
  });
  it('should return 400 and error message when title does not exists', (done) => {
    request(app)
      .post(categoryUrl)
      .send({
      })
      .expect((res) => {
        expect(res.status).toBe(400);
        expect(res.body.resultMessage).toMatch(/required/);
      })
      .end(done);
  });
});