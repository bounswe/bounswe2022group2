import {LearningSpace} from '../../../models/index.js';
import jwt from "jsonwebtoken";


//TODO: Remove this file after get learning space is implemented
//Returns mock course data regarding ls
export default async  (req, res) =>{

    //In future middleware will check for session information
    
    // ls : learning space
    let ls = await LearningSpace.find({}).limit(8);
    console.log(ls);
    if(ls.length < 8){
        return res.status(500).json({resultMessage: "Something is wrong."});
    }
    return res.status(200).json({
        resultMessage: "Success", 
        takenls: [ls[1].toJSON(), ls[2].toJSON()],
        friendls: [ls[3].toJSON(), ls[4].toJSON(), ls[5].toJSON()],
        recomendedls: [ls[0].toJSON(), ls[6].toJSON(), ls[7].toJSON()]
    })
}  