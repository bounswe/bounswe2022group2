import mongoose from 'mongoose';
import { Lesson, User } from '../../../models/index.js';

export default async (req,res) => {
    const userId = req.query.user_id;
    if(!userId || !mongoose.isValidObjectId(req.query.user_id)) {
        return res.status(400).json({ "resultMessage": "Please provide a valid user id." });
    }

    const user = await User.findById(userId)
    .catch(err => {
        return res.status(500).json({"resultMessage": err.message});
    });

    if(!user) return res.status(404).json({"resultMessage": "User with the given id does not exist"});

    const lessons = await Lesson.find({ _id: {$in: user.enrolledLessons} })
    .catch((err) => {
      return res.status(500).json({ "resultMessage": err.message });
    });

    return res.status(200).json({
        resultMessage: "Lessons are successfully fetched.",
        lessons: lessons,
    });
}