import mongoose from 'mongoose';
import {User} from './index.js'
const { Schema, model } = mongoose;

import chapterSchema from './chapter.js'

const lsSchema = new Schema({
  title: {
    type: String, required: true, unique: true
  },
  description: {
    type: String, required: true
  },
  num_participants: {
    type: Number, required: true, default: 1
  },
  icon_id: {type: Number, required: true, default: 1},
  categories: [{type: String}],
  creator: {type: String, required: true},
  admins: [{
    type: String, required: true
  }],
  chapters: {type: chapterSchema}
},
  {
    timestamps: true,
    toJSON: {
      transform: function (doc, ret, options) {

        ret.id = ret._id;
        delete ret._id;
        return ret;
      },
      virtuals: true,
    },
    versionKey: false,
  });

const LearningSpace = model('LearningSpace', lsSchema)
export default LearningSpace