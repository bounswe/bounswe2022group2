import jwt from "jsonwebtoken";
import { get } from "underscore";

import { LearningSpace , Categories} from '../../../models/index.js';
import { validateLS_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
  const { error } = validateLS_init(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }
  if ("categories" in req.body){
    const enum_check = req.body.categories.every(val => Categories.includes(val));
    
    if(!enum_check){
      console.log("Category mismatch");
      return res.status(400).json({ "resultMessage": "Please check your categories."});
    }
  }
  
  const exists_ls = await LearningSpace.exists({ title: req.body.title })
    .catch((err) => {
      console.log("Could not fetch users from mongoDB")
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });
  
  if (exists_ls) {
    const err = "There already exists an learning space with given title"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }

  const num_icons = 20;

  //assign a valid icon id if icon id is invalid
  if(!("icon_id" in req.body)){
    req.body.icon_id = Math.floor(Math.random() * num_icons);
  }else if(req.body.icon_id > 20 || req.body.icon_id <0){
    req.body.icon_id = Math.floor(Math.random() * num_icons);
  }
  var {username} = jwt.decode(req.body.token)

  //does not check if user exists, this case will be handled by the jwt middleware in future
  let ls = new LearningSpace({
    title: req.body.title,
    description: req.body.description,
    icon_id: req.body.icon_id,
    creator: username,
    categories: req.body.categories
  });

  ls = await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "Learning space is succesfully created.",
    learningSpace: ls
  });
};