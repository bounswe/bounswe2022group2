
import Annotation from '../../../models/annotation.js';
import jwt from "jsonwebtoken";
import { LearningSpace} from '../../../models/index.js';
import { validateAnnotation_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
  var username;
  try {
      const authHeader = req.headers.authorization;
      username = jwt.decode(authHeader).username;
  } catch (e) {
      return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
  }

  const { error } = validateAnnotation_init(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }


  let ls = await LearningSpace.findOne({ _id: req.body.ls_id })
    .catch((err) => {
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });
  
  if (!ls) {
    const err = "There is no learning space with given ID"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }

  let post = ls.posts.find(element => element.id == req.body.post_id);

  if (!post) {
    const err = "There is no post with given id"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
  let post_index = ls.posts.findIndex(element => element._id == req.body.post_id);
  let anno_id = `${ls.title}/post${post_index}/anno${post.annotations.length}`;
  let source = `${ls.title}/post${post_index}`;

 let selector = {};
 let annotation = new Annotation({
  body: req.body.body,
  _id: anno_id,
  type: req.body.type,
  creator: username,
  target: {}
});
  if(req.body.target.selector && req.body.target.selector.type == "TextPositionSelector"){
    selector.type = "TextPositionSelector";
    selector.start = req.body.target.selector.start;
    selector.end = req.body.target.selector.end;

    annotation.target.selector = selector;
    annotation.target.source = source;
  }
  
  if(req.body.target.type == "Image"){
    annotation.target.type = "Image";
    annotation.target.id = req.body.target.id;
    annotation.target.format = "image/jpeg";
  }

  post.annotations.push(annotation);

await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "Annotation is succesfully created.",
    learningSpace: ls
  });
};