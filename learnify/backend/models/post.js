import mongoose from 'mongoose';
const { Schema } = mongoose;


// We can add additional fields if we enlarge the features of the app.

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
  upvote: {
    type: Number, default:0
  },
  downvote: {
    type: Number, default:0
  },
  images:[{
    type: String
  }],


});


export default postSchema