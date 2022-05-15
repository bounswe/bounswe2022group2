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

  let user = await User.find({_id: userId, enrolledLessons: lessonId})
  .catch(err => {
    return res.status(500).json({"resultMessage": err.message});
  });

  if(user.length===0){
    return res.status(400).json({"resultMessage": "Could not find, problem can be one of the followings: user with the given id does not exist, lesson with the given id does not exist, user with the given id does not take the lesson with the given id"});
  }

  const lesson = await Lesson.findById(lessonId);

  user = await User.findByIdAndUpdate(userId, {$pull: {enrolledLessons: lessonId}}, {new:true})
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  return res.status(200).json({
    resultMessage: "Lesson is successfully dropped.", user: user, lesson: lesson
  });

}
