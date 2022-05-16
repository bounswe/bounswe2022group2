import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app, also we can make some fields required in future.
const eventSchema = new Schema({
  date: {type: Date, required:true},
  description: String,
  duration: Number,
  participation_limit: {type: Number, required:true},
  host_ID: {type: mongoose.Schema.Types.ObjectId, ref: 'User'},
  geolocation_lat: Number,
  geolocation_lon: Number,
  participants: [{type: mongoose.Schema.Types.ObjectId, ref: "User"}],
  num_of_participants: {type: Number, default:0},
  related_lesson: {type: mongoose.Schema.Types.ObjectId, ref: 'Lesson', required:true},
  isCompleted: {type:Boolean, default:false} 
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

const Event = model('Event', eventSchema);
export default Event;