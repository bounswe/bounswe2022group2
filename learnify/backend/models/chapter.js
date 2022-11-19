import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.

const chapterSchema = new Schema({
  name: {
    type: String, required: true
  },
  content:{
    type: String, required: true
  }
});


export default chapterSchema