import { User } from '../../../models/index.js';
import { Lesson } from '../../../models/index.js';
import mongoose from 'mongoose';

export default async (req, res) => {

  const userId = req.body.user_id;
  const lessonId = req.body.lesson_id;

  if(!userId || !lessonId){
    return res.status(400).json({ "resultMessage": "Please provide all necessary fields: user_id and lesson_id." });
  }

  if(!mongoose.isValidObjectId(userId) || !mongoose.isValidObjectId(lessonId)){
    return res.status(400).json({"resultMessage": "Please provide valid ids for user and lesson"});
  }

  const lesson = await Lesson.findById(lessonId)
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  if(!lesson) return res.status(400).json({"resultMessage": "The lesson with the given id could not be found"});
  
  let user = await User.findById(userId)
  .catch(err => {
    return res.status(500).json({"resultMessage": err.message});
  });

  if(!user) return res.status(400).json({"resultMessage": "The user with the given id could not be found"});

  if(!user.enrolledLessons.includes(lessonId)){
    return res.status(400).json({"resultMessage": "User does not take this lesson"});
  }

  user = await User.findByIdAndUpdate(userId, {$pull: {enrolledLessons: lessonId}}, {new:true})
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  return res.status(200).json({
    resultMessage: "Lesson is successfully dropped.", user: user, lesson: lesson
  });

}
