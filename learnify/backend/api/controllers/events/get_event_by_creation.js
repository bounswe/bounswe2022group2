import { Event } from '../../../models/index.js';
import jwt from "jsonwebtoken";

export default async (req, res) => {

    var username;
    console.log(req.headers);
    try{
      const authHeader = req.headers.authorization;
      username = jwt.decode(authHeader).username;
    }catch(e){
      return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
    }
    console.log(username);
    var ls = await Event.find({"eventCreator" : username}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });

    return res.status(200).json({events : ls})

}