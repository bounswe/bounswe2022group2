import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.

const postSchema = new Schema({
  name: {
    type: String, required: true
  },
  creator: {
    type: String, required: true
  },
  content:{
    type: String, required: true
  },
  images:[{
    type: String
  }],


});


export default postSchema