
import jwt from "jsonwebtoken";
import { LearningSpace } from '../../../models/index.js';
import { validateEditAnnotation_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
    var username;
    try {
        const authHeader = req.headers.authorization;
        username = jwt.decode(authHeader).username;
    } catch (e) {
        return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
    }

    const { error } = validateEditAnnotation_init(req.body);
    if (error) {
        console.log(error);
        return res.status(400).json({ "resultMessage": "Please check your inputs." });
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

    let annotation = post.annotations.find(element => element.id = req.body.annotation_id);
    if (!annotation) {
        const err = "There is no annotation with given id"
        console.log(err)
        return res.status(409).json({ "resultMessage": err });
    }
    let annotation_index = post.annotations.indexOf(annotation);
    let post_index = ls.posts.indexOf(post);
    
    if(req.body.body){
        annotation.body = req.body.body;
    }
    if(req.body.target.selector){
        annotation.target.selector.start = req.body.target.selector.start;
        annotation.target.selector.end = req.body.target.selector.end;
    }
    if(req.body.target.id){
        annotation.target.id = req.body.target.id;
    }

    annotation.creator = username;
    post.annotations[annotation_index] = annotation;
    ls.posts[post_index] = post;

    await ls.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
    });

    return res.status(200).json({
        resultMessage: "Annotation is succesfully updated.",
        learningSpace: ls
    });
};