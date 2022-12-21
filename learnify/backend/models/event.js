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
    latitude: {type: Number, required: true},
    longitude: {type: Number, required: true}
  },
  participants: {
    type: [String]
  },
  lsId: {
    type: String
  }
});

const Event = model('Event', eventSchema)
export default Event
