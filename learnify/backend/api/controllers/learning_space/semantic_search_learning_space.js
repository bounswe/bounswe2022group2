import axios from "axios";

import { LearningSpace } from '../../../models/index.js';
import { semantic_server } from "../../../config/index.js";
export default async (req, res) => {

    var ls;
    if(("query" in req.query)){
        var response = await axios.get(semantic_server + "/search/" + req.query.query);
        
        var titles = response.data.titles;
    
        ls = await LearningSpace.find({"title" : titles}).catch((err) =>{
            console.log(err.message)
            return res.status(500).json({ "resultMessage": "Could not find returned learning spaces in the DB" });
          });
    }else{
        ls = await LearningSpace.aggregate([
            { 
                "$match": {}
            },
            {
                "$sort": {
                    "Learningspace.num_participants": 1
                }
            },
            {
                "$unset": "BERT"
                
            }
        ]
        ).catch((err) =>{
            console.log(err.message)
            return res.status(500).json({ "resultMessage": "Could not find returned learning spaces in the DB" });
          });

          ls = ls.slice(0,10);

    }

    return res.status(200).json({learning_spaces : ls})

}