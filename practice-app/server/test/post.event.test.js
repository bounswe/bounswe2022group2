import { expect } from 'expect';
import request from 'supertest';
import mongoose from 'mongoose';
import app from './../src/app.js';
import { Category, Lesson, User } from '../src/models/index.js';

const categoryId = mongoose.Types.ObjectId();
const lessonId = mongoose.Types.ObjectId();
const userId = mongoose.Types.ObjectId();
const lecturerId = mongoose.Types.ObjectId();

const test_category = {
    _id: categoryId,
    title: "Test Category",
    description: "Test Description",
}

const test_user = {
    _id: userId,
    name: "Test User",
    password: "testpass",
    email: "testuser@test.com",
    enrolledLessons: [],
    attendedEvents: []
}

const test_lecturer = {
    _id: lecturerId,
    name: "Test Lecturer",
    password: "testpass",
    email: "testlecturer@test.com",
    enrolledLessons: [],
    attendedEvents: []
}

const test_lesson = {
    _id: lessonId,
    name: "Test Lesson",
    category_id: test_category._id,
    lecturer: lecturerId,
}

const test_event = {
    title: "Test Event 1",
    description: "Test event description 1",
    date: "10-10-2025",
    location: "Greenwich",
    host_id: test_user._id,
    lesson_id: test_lesson._id
}

const setCategory = async () => {
    await new Category(test_category).save();
}

const setUser = async () => {
    await new User(test_user).save();
    await new User(test_lecturer).save();
}

const setLesson = async () => {
    await new Lesson(test_lesson).save();
}

const addDummyData = async () => {
    await setCategory();
    await setLesson();
    await setUser();
};

describe('POST /event/createEvent', () => {

    const eventUrl = "/event/createEvent";
    beforeEach(addDummyData);

    it('should add event when the lesson_id, title, and date is valid', (done) => {
        const title = test_event.title;
        const description = test_event.description;
        const date = test_event.date;
        const location = test_event.location;
        const host_id = test_event.host_id;
        const lesson_id = test_event.lesson_id;

        request(app)
            .post(eventUrl)
            .send({ title, description, date, location, host_id, lesson_id })
            .expect((res) => {
                expect(res.body.event).not.toBeNull();
                expect(res.body.event).not.toBeUndefined();
                const event = res.body.event;
                expect(event._id).not.toBeNull();
                expect(event._id).not.toBeUndefined();
                expect(event.title).toBe(title);
                expect(res.status).toBe(200);
                expect(res.body.resultMessage).toMatch(/successfully created/);
            })
            .end(done);
    });

    it('should return 400 and error message when the title is shorter than 3 characters', (done) => {
        const description = test_event.description;
        const date = test_event.date;
        const location = test_event.location;
        const host_id = test_event.host_id;
        const lesson_id = test_event.lesson_id;
        request(app)
            .post(eventUrl)
            .send({
                title: "T",
                description: description,
                date: date,
                location: location,
                host_id: host_id,
                lesson_id: lesson_id
            })
            .expect((res) => {
                expect(res.status).toBe(400);
                expect(res.body.resultMessage).toMatch(/characters/);
            })
            .end(done);
    });

    it('should return 400 and error message when the date is expired compared to the current time', (done) => {
        const title = test_event.title;
        const description = test_event.description;
        const location = test_event.location;
        const host_id = test_event.host_id;
        const lesson_id = test_event.lesson_id;
        request(app)
            .post(eventUrl)
            .send({
                title: title,
                description: description,
                date: "10-10-1981",
                location: location,
                host_id: host_id,
                lesson_id: lesson_id
            })
            .expect((res) => {
                expect(res.status).toBe(400);
                expect(res.body.resultMessage).toMatch(/below/);
            })
            .end(done);
    });

    it('should return 400 and error message when the date is not in the format of MM-DD-YYYY', (done) => {
        const title = test_event.title;
        const description = test_event.description;
        const location = test_event.location;
        const host_id = test_event.host_id;
        const lesson_id = test_event.lesson_id;
        request(app)
        .post(eventUrl)
        .send({
            title: title,
            description: description,
            date: "23-12-2022",
            location: location,
            host_id: host_id,
            lesson_id: lesson_id
        })
        .expect((res) => {
            expect(res.status).toBe(400);
            expect(res.body.resultMessage).toMatch(/valid date/);
        })
        .end(done);
    });

    it('should return 400 and error message when the location is an invalid location', (done) => {
        const title = test_event.title;
        const description = test_event.description;
        const date = test_event.date;
        const host_id = test_event.host_id;
        const lesson_id = test_event.lesson_id;
        request(app)
        .post(eventUrl)
        .send({
            title: title,
            description: description,
            date: date,
            location: "nonexistinglocation",
            host_id: host_id,
            lesson_id: lesson_id
        })
        .expect((res) => {
            expect(res.status).toBe(400);
            expect(res.body.resultMessage).toMatch(/Invalid address/);
        })
        .end(done);
    });

    it('should return 404 and error message when there is not any lesson with given lesson_id', (done) => {
        const title = test_event.title;
        const description = test_event.description;
        const date = test_event.date;
        const location = test_event.location;
        const host_id = test_event.host_id;
        request(app)
            .post(eventUrl)
            .send({
                title: title,
                description: description,
                date: date,
                location: location,
                host_id: host_id,
                lesson_id: "6283b6deb5a032a244f75010"
            })
            .expect((res) => {
                expect(res.status).toBe(404);
                expect(res.body.resultMessage).toMatch(/does not exist./);
            })
            .end(done);
    });

});

afterEach(async () => {
    await Category.findByIdAndDelete(test_category._id);
    await Lesson.findByIdAndDelete(test_lesson._id);
    await User.findByIdAndDelete(test_user._id);
    await User.findByIdAndDelete(test_lecturer._id);
});