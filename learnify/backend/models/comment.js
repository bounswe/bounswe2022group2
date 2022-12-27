import mongoose from 'mongoose';
const { Schema, model } = mongoose;

const commentSchema = new Schema({
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

const Comment = model('Comment', commentSchema)
export default Comment