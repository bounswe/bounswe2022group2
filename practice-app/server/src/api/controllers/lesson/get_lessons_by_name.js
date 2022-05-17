import mongoose from 'mongoose';
import { Lesson } from '../../../models/index.js';
import { Category } from '../../../models/index.js';

export default async (req, res) => {
  const name = req.query.name;
  
  if (!name || typeof name === 'string' || name instanceof String) {
    return res.status(400).json({ "resultMessage": name });
  }

  const lessons = await Lesson.find({ name: name })
    .catch((err) => {
      return res.status(500).json({ "resultMessage": "Wrong name." });
    });

  return res.status(200).json({
    resultMessage: "Lessons are successfully fetched.",
    lessons: lessons,
  });
};
