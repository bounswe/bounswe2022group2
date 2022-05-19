import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Category, Lesson } from '../src/models/index.js';
import app from './../src/app.js';


const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];

const categories = [
  {
    _id: ids[0],
    name: "Mathematic",
  },
  {
    _id: ids[1],
    name: "Computer",
  },
  {
    _id: ids[2],
    name: "Sports",
  },
];

const setCategories = async () => {
  await new Category(categories[0]).save();
  await new Category(categories[1]).save();
  await new Category(categories[2]).save();
}

const addDummyData = async () => {
  await setCategories();
};


describe('GET /category/filterByName', () => {
  const byNameUrl = '/category/filterByName';
  beforeEach(addDummyData);

  it('should return all categories including given title', (done) => {
    request(app)
      .get(byNameUrl)
      .query({ title: "mat" })
      .expect((res) => {
        expect(res.body.categories).not.toBeNull();
        expect(res.body.categories).not.toBeUndefined();
        expect(res.body.categories).toHaveLength(2);
        const firstCat = res.body.categories[0];
        expect(firstCat).not.toBeNull();
        expect(firstCat).not.toBeUndefined();
        expect(firstCat._id).not.toBeNull();
        expect(firstCat._id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
  it('should return all categories including given title', (done) => {
    request(app)
      .get(byNameUrl)
      .query({ title: "" })
      .expect((res) => {
        expect(res.body.categories).not.toBeNull();
        expect(res.body.categories).not.toBeUndefined();
        expect(res.body.categories).toHaveLength(2);
        const firstCat = res.body.categories[0];
        expect(firstCat).not.toBeNull();
        expect(firstCat).not.toBeUndefined();
        expect(firstCat._id).not.toBeNull();
        expect(firstCat._id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
  it('should return all categories including given title', (done) => {
    request(app)
      .get(byNameUrl)
      .query({ title: "asdasd" })
      .expect((res) => {
        expect(res.body.categories).not.toBeNull();
        expect(res.body.categories).not.toBeUndefined();
        expect(res.body.categories).toHaveLength(2);
        const firstCat = res.body.categories[0];
        expect(firstCat).not.toBeNull();
        expect(firstCat).not.toBeUndefined();
        expect(firstCat._id).not.toBeNull();
        expect(firstCat._id).not.toBeUndefined();
        expect(res.statusCode).toBe(200);
      })
      .end(done);
  });
});

afterEach(async () => {
  await Category.deleteMany({ _id: { $in: ids } });
});