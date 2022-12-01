import mongoose from 'mongoose';
import Annotation from './annotation.js';
import annotationSchema from './annotation.js';
const { Schema, model } = mongoose;


// We can add additional fields if we enlarge the features of the app.

const chapterSchema = new Schema({
  name: {
    type: String, required: true
  },
  content:{
    type: String, required: true
  },
  annotations: [{
    type: Schema.Types.Mixed,
  }]
  
});


export default chapterSchema