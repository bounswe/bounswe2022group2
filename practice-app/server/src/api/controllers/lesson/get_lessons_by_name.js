import { Lesson } from '../../../models/index.js';

export default async (req, res) => {
  const name = req.query.name;
  
  if (!name) 
    return res.status(400).json({ "resultMessage": "Please provide a valid name." });
  
  const lessons = await Lesson.find({ name: name })
    .catch((err) => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  if (lessons.length != 0)
    return res.status(200).json({
      resultMessage: "Lessons are successfully fetched.",
      lessons: lessons,
    });
  
  return res.status(404).json({ "resultMessage": "Lesson cannot found."});
};
