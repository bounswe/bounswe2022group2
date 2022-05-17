import { Rating } from '../../../models/index.js';
import { Lesson } from '../../../models/index.js';
import { validateReqBody } from '../../validators/rating.validator.js';
import mongoose from 'mongoose';


async function createRating(req) {

    const { error } = validateReqBody(req);
    if (error) {
        throw new Error(error.details[0].message);
    }
    var lessonFlag = mongoose.Types.ObjectId.isValid(req.lessonID);
    if(!lessonFlag){
        throw new Error('Such an ID cannot exist.');
    }
    var lessonID = mongoose.Types.ObjectId(req.lessonID);
    const existingLesson = await Lesson.findById(req.lessonID)
    .catch((err) => {
        return new Error('Lesson does not exist.');;
    });
    const existingRating = await Rating.find({ lessonID: lessonID })
    .catch((err) => {
        return new Error(err.message);;
    });
    
    if (!existingLesson)
    return ({
        "resultMessage": "Lesson does not exist.",
        lessonID: existingLesson
        });

        
        let rating = new Rating({
        lessonID: lessonID,
        rating: req.rating,
    });
    if (existingRating.length > 0){
            var newRating = Number(req.rating)+ Number(existingRating[0].rating);
            existingRating[0].rating = newRating;
            rating = existingRating[0];
    }
    rating = await rating.save().catch((err) => {
        return new Error(err.message);
    });
    
    
    
    return {
        resultMessage: "Rating successfully created.", rating: rating.toJSON()
    };
}

export {createRating}; 