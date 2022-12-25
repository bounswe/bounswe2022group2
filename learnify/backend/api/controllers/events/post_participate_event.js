import jwt from "jsonwebtoken";

import { Event} from '../../../models/index.js';


export default async (req, res) => {
  var username;
  console.log(req.headers);
  try{
    const authHeader = req.headers.authorization;
    username = jwt.decode(authHeader).username;
  }catch(e){
    return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
  }

  let event = await Event.findOne({_id: req.params.event})
  .catch((err) => {
    console.log("Could not fetch learning space from mongoDB")
    console.log(err.message);
    return res.status(500).json({ "resultMessage": "Something is wrong." });
  });
  console.log(event)
  if (!event) {
    const err = "The event does not exists"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
  if(!event.num_participants === participationLimit){
    return res.status(400).json({ "resultMessage": "Event participation limit reached." });
  }
  if(!event.participants.includes(username)){
      event.participants.push(username);
      event.num_participants += 1 
    }

  event = await event.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });


  return res.status(200).json({
    resultMessage: "Successfully participated.",
    event: event
  });
};
