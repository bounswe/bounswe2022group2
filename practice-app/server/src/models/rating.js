import mongoose from "mongoose";
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.
const ratingSchema = new Schema({
  lessonID: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Lesson",
    required: true,
  },
  name: { type: String },
  rating: {
    type: Number,
    required: true,
  },
  versionKey: false,
});

ratingSchema.options.toJSON = {
  transform: function (doc, ret, options) {
    return {
      id: ret._id,
      lessonID: ret.lessonID,
      rating: ret.rating,
      name: ret.name,
    };
  },
};
const Rating = model("Rating", ratingSchema);

export default Rating;
