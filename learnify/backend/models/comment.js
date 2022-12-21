import mongoose from 'mongoose';
const { Schema } = mongoose;

const commentSchema = new Schema({
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

});


export default commentSchema