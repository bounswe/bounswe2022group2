import {Course} from '../../../models/index.js';
import jwt from "jsonwebtoken";

//Returns mock course data regarding courses
export default async  (req, res) =>{

    //In future middleware will check for session information
    
    let courses = await Course.find({}).limit(8);
    console.log(courses);
    if(courses.length < 8){
        return res.status(500).json({resultMessage: "Something is wrong."});
    }
    return res.status(200).json({
        resultMessage: "Success", 
        takenCourses: [courses[1].toJSON(), courses[2].toJSON()],
        friendCourses: [courses[3].toJSON(), courses[4].toJSON(), courses[5].toJSON()],
        recomendedCourses: [courses[0].toJSON(), courses[6].toJSON(), courses[7].toJSON()]
    })
}  