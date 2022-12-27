import axios from "axios";

import { LearningSpace } from '../../../models/index.js';
import { semantic_server } from "../../../config/index.js";
export default async (req, res) => {

    var ls;
    if(("query" in req.query)){
        console.log("query is :" +  req.query.query)
        if(req.query.query == "")
        return res.status(400).json({ "resultMessage": "Query string is empty" });
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
                    "num_participants": -1
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

    }

    return res.status(200).json({learning_spaces : ls})

}
