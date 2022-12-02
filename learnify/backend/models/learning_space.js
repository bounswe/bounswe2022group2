import mongoose from 'mongoose';
import categories from './categories.js';


console.log(categories)
const { Schema, model } = mongoose;

import postSchema from './post.js'

const lsSchema = new Schema({
  title: {
    type: String, required: true, unique: true
  },
  description: {
    type: String, required: true
  },
  participants: [{type: String, required: true}],
  num_participants: {
    type: Number, required: true, default: 1
  },
  icon_id: {type: Number, required: true, default: 1},
  categories: [{type: String}],
  creator: {type: String, required: true},
  admins: [{
    type: String, required: true
  }],
  posts: [{type: postSchema}],
  categories: [{type: String, enum: categories}]
},
  {
    timestamps: true,
    toJSON: {
      transform: function (doc, ret, options) {

        ret.id = ret._id;
        ret.title = ret._title;
        delete ret.BERT;
        delete ret._id;
        return ret;
      },
      virtuals: true,
    },
    versionKey: false,
  });

const LearningSpace = model('LearningSpace', lsSchema)
export default LearningSpace