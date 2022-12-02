

import { LearningSpace, Categories } from '../../../models/index.js';
export default async (req, res) => {

    if(!(Categories.includes(req.params.category))){
        return res.status(400).json({ "resultMessage": "Invalid category" });
    }
    var ls = await LearningSpace.find({"categories" :{"$in": [req.params.category]}}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });

    return res.status(200).json({learning_spaces : ls})

}