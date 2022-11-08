import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.
const lsSchema = new Schema({
  name: {
    type: String, required: true
  },
  num_participants: {
    type: Number, required: true, default: 1
  },
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