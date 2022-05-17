import { User } from '../../../models/index.js';
import { Lesson } from '../../../models/index.js';
import { validateDropLesson } from '../../validators/user.validator.js';

export default async (req, res) => {

  const { error } = validateDropLesson(req.body);

  if (error) {
    return res.status(400).json({ "resultMessage": error.details[0].message });
  }

  const userId = req.body.user_id;
  const lessonId = req.body.lesson_id;

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
