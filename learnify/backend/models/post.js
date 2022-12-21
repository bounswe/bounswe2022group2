import mongoose from 'mongoose';
const { Schema } = mongoose;


// We can add additional fields if we enlarge the features of the app.

import commentSchema from './comment.js';

const postSchema = new Schema({
  title: {
    type: String, required: true
  },
  creator: {
    type: String, required: true
  },
  content:{
    type: String, required: true
  },
  annotations: [{
    type: Schema.Types.Mixed,
  }],
  images:[{
    type: String
  }],
  comments:[{
    type: commentSchema
  }],

});

export default postSchema