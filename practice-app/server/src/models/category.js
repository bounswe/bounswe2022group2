import mongoose from 'mongoose';
const { Schema, model } = mongoose;

// We can add additional fields if we enlarge the features of the app.
const categorySchema = new Schema({
    title: {
        type: String,
        minlength: [5, 'Please provide a longer name'],
        required: true,
    },
    description: String,
    lectures: [mongoose.ObjectId],
    // transform:  ( (doc, ret, options) => {
    //       ret.id = ret._id;
    //       return ret;
    //     }),
    // virtuals: true,
      versionKey: false
});

categorySchema.options.toJSON = {
    transform: function(doc, ret, options) {
        ret.id = ret._id;
        return ret;
    }
};
const Category = model('Category', categorySchema);
export default Category;
