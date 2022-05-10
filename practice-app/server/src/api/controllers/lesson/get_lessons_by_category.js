import mongoose from 'mongoose';
import { Lesson } from '../../../models/index.js';

export default async (req, res) => {
  const categoryId = req.query.category_id;
  if (!categoryId || !mongoose.isValidObjectId(req.query.category_id)) {
    return res.status(400).json({ "resultMessage": "Please provide a valid category id." });
  }

  const lessons = await Lesson.find({ category_id: categoryId })
    .catch((err) => {
      return res.status(500).json({ "resultMessage": err.message });
    });

  return res.status(200).json({
    resultMessage: "Lessons are successfully fetched.",
    lessons: lessons,
  });
};
