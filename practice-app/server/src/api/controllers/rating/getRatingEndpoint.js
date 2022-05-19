import { Rating } from '../../../models/index.js';
import Lesson from '../../../models/lesson.js';
import { validateGetReqBody } from '../../validators/rating.validator.js';

export default async (req, res) => {
    let status = 200;
    const { error } = validateGetReqBody(req.query);
    if(error) {
        status = 400;
        return res.status(status).json({ "resultMessage": error.message });
    }
    const ratings = await Rating.find({rating: {$gte: req.query.min, $lte: req.query.max}})
    .catch(err=>{
        return res.status(500).json({ "resultMessage": err.message });
    });
    ratings.forEach(async element => {
        console.log(element);
        console.log(element.lessonID);
        console.log(element.lessonID.toString());
        const lesson = await Lesson.findById(element.lessonID.toString());
        element.name = lesson.name;
    });
    return res.status(200).json(ratings);
    
};


