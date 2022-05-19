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
    },
    host_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    lesson_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Lesson', required: true }
});

const Event = model('Event', eventSchema);
export default Event;