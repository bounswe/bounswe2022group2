
import { Post } from '../../../models/index.js';
import { LearningSpace } from '../../../models/index.js';
import mongoose from 'mongoose';
import jwt from "jsonwebtoken";
import commentSchema from '../../../models/comment.js';
import { validateComment_init } from '../../validators/learning_space_init_validator.js';
const { model } = mongoose;
const Comment = model('Comment', commentSchema)



export default async (req, res) => {
    var username;
    try {
        const authHeader = req.body.token;
        username = jwt.decode(authHeader).username;
    } catch (e) {
        return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
    }

    const { error } = validateComment_init(req.body);
    if (error) {
        console.log(error);
        return res.status(400).json({ "resultMessage": "Please check your inputs." });
    }

    let ls = await LearningSpace.findOne({ _id: req.body.ls_id })
        .catch((err) => {
            console.log(err.message);
            return res.status(500).json({ "resultMessage": "Something is wrong." });
        });
    
    let post;
        ls.posts.forEach(function(check) {
            if(check._id == req.body.post_id){
                post = check;
            }
        });
        
        

    if (!post) {
        return res.status(404).json({ "resultMessage": "There is no post for current learning space." });
    }


    let comment = new Comment({
        content: req.body.content,
        creator: username,
        images: [],
    });

    if(req.body.images){
        post.images = req.body.images;
    }

    post.comments.push(comment);
    console.log(post)
    await post.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save post to DB" });
    });

    };