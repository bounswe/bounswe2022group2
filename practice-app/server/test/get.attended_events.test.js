import { expect } from 'expect';
import mongoose from 'mongoose';
import request from 'supertest';
import { Event, User } from '../src/models/index.js';
import app from '../src/app.js';

const userId = mongoose.Types.ObjectId();
const event_ids = [mongoose.Types.ObjectId(), mongoose.Types.ObjectId()];
const test_user = {
    _id: userId,
    name: "Test User",
    email: "testuser@test.com",
    password: "testpass",
    attendedEvents: [event_ids[0], event_ids[1]]
}

const events = [
    {
        _id: event_ids[0],
        title: "Test Event 1",
        date: "10-10-2030",
        location: "Greenwich",
        host_id: mongoose.Types.ObjectId(),
        lesson_id: mongoose.Types.ObjectId()
    },
    {
        _id: event_ids[1],
        title: "Test Event 2",
        date: "10-10-2030",
        location: "Greenwich",
        host_id: mongoose.Types.ObjectId(),
        lesson_id: mongoose.Types.ObjectId()
    },
];

const setUser = async () => {
    await new User(test_user).save();
}

const setEvents = async () => {
    await new Event(events[0]).save();
    await new Event(events[1]).save();
}

const addDummyData = async () => {
    await setUser();
    await setEvents();
};

describe('GET /user/attendedEvents', () => {

    const attendedEventsUrl = '/user/attendedEvents';
    beforeEach(addDummyData);

    it('should return all events that the user attends if the user_id is valid', (done) => {
        request(app)
            .get(attendedEventsUrl)
            .query({ user_id: userId.toString() })
            .expect((res) => {
                expect(res.body.events).not.toBeNull();
                expect(res.body.events).not.toBeUndefined();
                expect(res.body.events).toHaveLength(2);
                const firstEvent = res.body.events[0];
                expect(firstEvent).not.toBeNull();
                expect(firstEvent).not.toBeUndefined();
                expect(firstEvent[0]._id).not.toBeNull();
                expect(firstEvent[0]._id).not.toBeUndefined();
                expect(res.statusCode).toBe(200);
            })
            .end(done);
    });

    it('should return validation error if the query parameter user_id is invalid', (done) => {
        request(app)
            .get(attendedEventsUrl)
            .query({ user_id: "111" })
            .expect(400)
            .end(done);
    });
});

afterEach(async () => {
    await User.findByIdAndDelete(test_user._id);
    await Event.deleteMany({ _id: { $in: event_ids } });
});