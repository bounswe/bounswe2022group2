import mongoose from 'mongoose';
const { Schema, model } = mongoose;

const eventSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String
    },
    date: {
        type: Date,
        required: true,
    },
    location: {
        type: String,
        required: true,
    }
});

const Event = model('Event', eventSchema);
export default Event;