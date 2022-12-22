import jwt from "jsonwebtoken";

import { Event} from '../../../models/index.js';
import LearningSpace from "../../../models/learning_space.js";
import { validateEvent } from '../../validators/event_validator.js';

export default async (req, res) => {
  var username;
  console.log(req.headers);
  try{
    const authHeader = req.headers.authorization;
    username = jwt.decode(authHeader).username;
  }catch(e){
    return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
  }


  const { error } = validateEvent(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }
  
  const exists_event = await Event.exists({ title: req.body.title })
    .catch((err) => {
      console.log("Could not fetch events from mongoDB")
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });

    const exists_LS = await LearningSpace.exists({ id: req.body.lsId })
    .catch((err) => {
      console.log("Could not fetch events from mongoDB")
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });
  
  if (exists_event) {
    const err = "There already exists an event with given title"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
  if (!exists_LS) {
    const err = "LS with given id does not exists"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
  let event = new Event({
    title: req.body.title,
    description: req.body.description,
    date: req.body.date,
    duration: req.body.duration,
    eventCreator: username,
    geolocation: req.body.geolocation,
    lsId : req.body.lsId
  });

  event.participants.push(username);

  event = await event.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });


  return res.status(200).json({
    resultMessage: "Event is succesfully created.",
    event: event
  });
};
