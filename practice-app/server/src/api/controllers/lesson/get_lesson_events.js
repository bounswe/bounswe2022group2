import mongoose from 'mongoose';
import { Lesson } from '../../../models/index.js';
import { Event} from '../../../models/index.js';

export default async (req,res) => {
    const lessonId = req.query.lesson_id;
    if(!lessonId || !mongoose.isValidObjectId(req.query.lesson_id)) {
        return res.status(400).json({ "resultMessage": "Please provide a valid lesson id." });
    }

    const lesson = await Lesson.findById(lessonId)
    .catch(err => {
        return res.status(500).json({"resultMessage": err.message});
    });

    if(!lesson) return res.status(404).json({"resultMessage": "Lesson with the given id does not exist"});

    const events = await Event.find({ related_lesson: lessonId })
    .catch((err) => {
      return res.status(500).json({ "resultMessage": err.message });
    });

    return res.status(200).json({
        resultMessage: "Events are successfully fetched.",
        events: events,
    });
}