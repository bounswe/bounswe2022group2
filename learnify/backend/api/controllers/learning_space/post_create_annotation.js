
import Annotation from '../../../models/annotation.js';
import { LearningSpace} from '../../../models/index.js';
import { validateAnnotation_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
  const { error } = validateAnnotation_init(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }


  let ls = await LearningSpace.findOne({ title: req.body.ls_title })
    .catch((err) => {
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });
  
  if (!ls) {
    const err = "There is no learning space with given title"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }

  console.log(ls);
  let chapter = ls.chapters.find(element => element.name == req.body.chapterName);
  console.log(chapter);
  if (!chapter) {
    const err = "There is no chapter with given id"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }

  let chapterName = chapter.name.replace(/\s/g, '');
  let anno_id = `${req.body.ls_title}/${chapterName}/anno${chapter.annotations.length}`;
  let source = `${req.body.ls_title}/${chapterName}`;

 let selector = {};
 let annotation = new Annotation({
  body: req.body.body,
  _id: anno_id,
  type: req.body.type,
  target: {
  }
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


 
  


  chapter.annotations.push(annotation);

await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "Annotation is succesfully created.",
    learningSpace: ls
  });
};