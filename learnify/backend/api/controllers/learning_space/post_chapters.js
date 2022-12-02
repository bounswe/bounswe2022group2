
import { LearningSpace} from '../../../models/index.js';
import mongoose from 'mongoose';
import chapterSchema from '../../../models/chapter.js'; 
//import { validateLS_init } from '../../validators/learning_space_init_validator.js';
const { Schema, model } = mongoose;
const Chapter = model('Chapter', chapterSchema)


export default async (req, res) => {
//   const { error } = validateLS_init(req.body);
//   if (error) {
//     console.log(error);
//     return res.status(400).json({ "resultMessage": "Please check your inputs."});
//   }

let ls = await LearningSpace.findOne({ title: req.body.ls_title })
.catch((err) => {
  console.log(err.message);
  return res.status(500).json({ "resultMessage": "Something is wrong." });
});

let chapter = new Chapter({
    name: req.body.name,
    content: req.body.content,
    annotations: [],
  });

ls.chapters.push(chapter);
await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "Chapter is succesfully created.",
    learningSpace: ls
  });
};