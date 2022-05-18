import { expect } from 'expect';
import request from 'supertest';
import axios from 'axios';
import sinon from 'sinon';
import app from './../src/app.js';
import { Category } from '../src/models/index.js';

const mockCategories = [
    {
    "title": "Calculus",
    "description": "mockDescription"
    },
    {
        "title": "Calculus",
        "description": "mockDescription"
    }
]
describe('GET /api/category', () => {

    const categoryUrl = "/category";

    afterEach(function () {
        sinon.restore();
    });
    it('should return all categories', (done) => {
        sinon.stub(Category, "find")
            .onFirstCall().resolves(
                mockCategories
            );

        request(app)
            .get(categoryUrl)
            .expect((res) => {
                expect(res.status).toBe(200);
                expect(res.body).toEqual(mockCategories);
            })
            .end(done);
    });
});