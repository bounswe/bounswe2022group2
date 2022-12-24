import mongoose from 'mongoose';

const { Schema, model } = mongoose;
const eventSchema = new Schema({
  date: {
    type: Date,
    required: true
  },
  description: {
    type: String
  },
  title: {
    type: String,
    required: true,
    unique: true
  },
  duration: {
    type: Number
  },
  participationLimit: {
    type: Number
  },
  eventCreator: {
    type: String
  },
  geolocation:{
    accuracy: {type: Number, required: true},
    latitude: {type: Number, required: true},
    longitude: {type: Number, required: true}
  },
  participants: {
    type: [String]
  },
  num_participants: {
    type: Number, default: 1
  },
  lsId: {
    type: String
  }
});

const Event = model('Event', eventSchema)
export default Event
