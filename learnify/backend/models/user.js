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
  username: {
    type: String, required: true, unique: true
  },
  is_verified: {
    type: Boolean, required: true, default: false
  },
  verification_code: {
    type: String, required: false, default: false
  },
},
  {
    timestamps: true,
    toJSON: {
      transform: function (doc, ret, options) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.password;
        delete ret.is_verified;
        delete ret.verification_code;
        delete ret.updated_at;
        return ret;
      },
      virtuals: true,
    },
    versionKey: false,
  });

const User = model('User', userSchema)
export default User
