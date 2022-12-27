import { LearningSpace } from '../../../models/index.js';
import jwt from "jsonwebtoken";
import axios from "axios";
import { semantic_server } from "../../../config/index.js";

export default async (req, res) => {

    var username;
    console.log(req.headers);
    try{
      const authHeader = req.headers.authorization;
      username = jwt.decode(authHeader).username;
    }catch(e){
      return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
    }
    var response = await axios.get(semantic_server + "/reccomended/" + username);
    var titles = response.data.titles;
    
    let ls = await LearningSpace.find({"title" : titles}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not find returned learning spaces in the DB" });
    });

    return res.status(200).json({learning_spaces : ls})
}