import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.
const userSchema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
    lowercase: true,
    match: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
  },
  password: {
    type: String, required: true, select: false
  },
  name: {
    type: String, required: true
  },
  enrolledLessons: [{
    type: mongoose.Schema.Types.ObjectId, ref: "Lesson"
  }],
},
  {
    timestamps: true,
    toJSON: {
      transform: function (doc, ret, options) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.password;
        return ret;
      },
      virtuals: true,
    },
    versionKey: false,
  });

const User = model('User', userSchema)
export default User