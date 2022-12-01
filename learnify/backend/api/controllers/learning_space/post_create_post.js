
import { LearningSpace } from '../../../models/index.js';
import mongoose from 'mongoose';
import jwt from "jsonwebtoken";
import postSchema from '../../../models/post.js'; 
import { validatePost_init } from '../../validators/learning_space_init_validator.js';
const { Schema, model } = mongoose;
const Post = model('Post', postSchema)


export default async (req, res) => {
  const { error } = validatePost_init(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }

let ls = await LearningSpace.findOne({ title: req.body.ls_title })
.catch((err) => {
  console.log(err.message);
  return res.status(500).json({ "resultMessage": "Something is wrong." });
});

if(!ls){
    return res.status(404).json({ "resultMessage": "There is no learning space with given title." });
}

var {username} = jwt.decode(req.body.token);

let post = new Post({
    name: req.body.name,
    content: req.body.content,
    creator: username,
    images: [],
  });

ls.posts.push(post);
await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "Post is succesfully created.",
    learningSpace: ls
  });
};