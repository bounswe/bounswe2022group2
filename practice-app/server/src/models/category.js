import mongoose from 'mongoose';
const { Schema, model } = mongoose;

const categorySchema = new mongoose.Schema({
    title: {
        type: String,
        minlength: [5, 'Please provide a longer name'],
        required: true,
    },
    description: String,
    lectures: [mongoose.ObjectId]
});

const Category = model('Category', categorySchema);
export default Category;