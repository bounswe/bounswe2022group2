import { expect } from 'expect';
import request from 'supertest';
import mongoose from 'mongoose';
import axios from 'axios';
import sinon from 'sinon';
import app from './../src/app.js';
import { Event } from '../src/models/index.js';
import { Lesson } from '../src/models/index.js';

const ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];

const testEvent = {
    "title": "Test Event Title",
    "description": "Test event description.",
    "date": "09.09.2099",
    "location": "greenwich moseley row",
    "host_id": "6283b4abb2bfe69a7025f2f8",
    "lesson_id": "6283b6deb5a032a244f75018"
}

describe('POST /event/createEvent', () => {

    const eventUrl = "/event/createEvent";

    afterEach(function () {
        sinon.restore();
    });

    it('should add event when the lesson_id, title, and date is valid', (done) => {
        sinon.stub(Event.prototype, "save")
            .onFirstCall().resolves(
                new Event({
                    title: testEvent.title,
                    description: testEvent.description,
                    date: testEvent.date,
                    location: testEvent.location,
                    host_id: testEvent.host_id,
                    lesson_id: testEvent.lesson_id
                })
            );
        sinon.stub(Event, "findById")
            .onFirstCall().resolves(
                [
                    {
                        "lesson_id":testEvent.lesson_id
                    }
                ]
            );
        sinon.stub(Lesson, "findById")
            .onFirstCall().resolves(
                [
                    {
                        "lesson_id":testEvent.lesson_id
                    }
                ]
            );
        request(app)
            .post(eventUrl)
            .send({
                title: testEvent.title,
                description: testEvent.description,
                date: testEvent.date,
                location: testEvent.location,
                host_id: testEvent.host_id,
                lesson_id: testEvent.lesson_id
            })
            .expect((res) => {
                expect(res.status).toBe(200);
                expect(res.body.resultMessage).toMatch(/successfully created/);
                expect(res.body.event.title == testEvent.title);
            })
            .end(done);
    });

    it('should return 400 and error message when the title is shorter than 3 characters', (done) => {
        request(app)
            .post(eventUrl)
            .send({
                title: "T",
                description: testEvent.description,
                date: testEvent.date,
                location: testEvent.location,
                host_id: testEvent.host_id,
                lesson_id: testEvent.lesson_id
            })
            .expect((res) => {
                expect(res.status).toBe(400);
                expect(res.body.resultMessage).toMatch(/characters/);
            })
            .end(done);
    });

    it('should return 400 and error message when the date is expired compared to the current time', (done) => {
        request(app)
            .post(eventUrl)
            .send({
                title: testEvent.description,
                description: testEvent.description,
                date: "10-10-1981",
                location: testEvent.location,
                host_id: testEvent.host_id,
                lesson_id: testEvent.lesson_id
            })
            .expect((res) => {
                expect(res.status).toBe(400);
                expect(res.body.resultMessage).toMatch(/below/);
            })
            .end(done);
    });

    it('should return 400 and error message when the date is not in the format of MM-DD-YYYY', (done) => {
        request(app)
        .post(eventUrl)
        .send({
            title: testEvent.description,
            description: testEvent.description,
            date: "23-12-2022",
            location: testEvent.location,
            host_id: testEvent.host_id,
            lesson_id: testEvent.lesson_id
        })
        .expect((res) => {
            expect(res.status).toBe(400);
            expect(res.body.resultMessage).toMatch(/valid date/);
        })
        .end(done);
    });

    it('should return 400 and error message when the location is an invalid location', (done) => {
        request(app)
        .post(eventUrl)
        .send({
            title: testEvent.description,
            description: testEvent.description,
            date: testEvent.date,
            location: "nonexistinglocation",
            host_id: testEvent.host_id,
            lesson_id: testEvent.lesson_id
        })
        .expect((res) => {
            expect(res.status).toBe(400);
            expect(res.body.resultMessage).toMatch(/Invalid address/);
        })
        .end(done);
    });

    it('should return 404 and error message when there is not any lesson with given lesson_id', (done) => {
        sinon.stub(Event, "findById")
            .onFirstCall().resolves(
                []
            );
        request(app)
            .post(eventUrl)
            .send({
                title: testEvent.description,
                description: testEvent.description,
                date: testEvent.date,
                location: testEvent.location,
                host_id: testEvent.host_id,
                lesson_id: "6283b6deb5a032a244f75012"
            })
            .expect((res) => {
                expect(res.status).toBe(404);
                expect(res.body.resultMessage).toMatch(/does not exist./);
            })
            .end(done);
    });

});