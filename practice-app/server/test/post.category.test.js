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
  var sandbox;

  afterEach(function () {
    sinon.restore();
  });
  it('should add category when the title is valid', (done) => {

    var spy = sinon.spy();
    sinon.stub(axios, "get")
      .onFirstCall().returns({
        "data": {
          "query": {
            "search": [
              {
                "title": mockCategory.title
              }
            ]
          }
        }
      })
      .onSecondCall().returns(
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
        expect(res.status == 200);
        expect(res.body.resultMessage == "Category successfully created.");
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
        expect(res.status == 409);
        expect(res.body.resultMessage == "Category already exists.");
        expect(res.body.category.description == mockCategory.description);
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
        expect(res.status == 400);
        expect(res.body.resultMessage.match(/characters/));
      })
      .end(done);
  });
});