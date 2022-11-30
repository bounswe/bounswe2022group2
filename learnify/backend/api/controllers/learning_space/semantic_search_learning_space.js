import axios from "axios";

import { LearningSpace } from '../../../models/index.js';
import { semantic_server } from "../../../config/index.js";
export default async (req, res) => {

    if(!("query" in req.query)){
        return res.status(400).json({"resultMessage": "Please enter your query string."})
    }
    var response = await axios.get(semantic_server + "/search/" + req.query.query);
    
    var titles = response.data.titles;

    var ls = await LearningSpace.find({"title" : titles}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not find returned learning spaces in the DB" });
      });

    return res.status(200).json({learning_spaces : ls})

}