import mongoose from 'mongoose';
const { Schema, model } = mongoose;

import {chapterSchema} from './chapter.js'

const lsSchema = new Schema({
  name: {
    type: String, required: true
  },
  topic: {
    type: String
  },
  num_participants: {
    type: Number, required: true, default: 1
  },
  creator: {type: mongoose.Types.ObjectId, required: true},
  admins: [{
    type: mongoose.Types.ObjectId, required: true
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