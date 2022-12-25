
import { LearningSpace } from '../../../models/index.js';
import jwt from "jsonwebtoken";
import { validateEditComment_init } from '../../validators/learning_space_init_validator.js';



export default async (req, res) => {
    var username;
    try {
        const authHeader = req.headers.authorization;
        console.log(jwt.decode(authHeader))
        username = jwt.decode(authHeader).username;
    } catch (e) {
        return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
    }

    const { error } = validateEditComment_init(req.body);
    if (error) {
        console.log(error);
        return res.status(400).json({ "resultMessage": "Please check your inputs." });
    }

    let ls = await LearningSpace.findOne({ _id: req.body.ls_id })
        .catch((err) => {
            console.log(err.message);
            return res.status(500).json({ "resultMessage": "Something is wrong." });
        });
    
    var post;
    var postIndex = 0;
        ls.posts.forEach(function(check) {
            if(check._id == req.body.post_id){
                post = check;
            }
            if(!post){
                postIndex++;
            }
        });
        
        

    if (!post) {
        return res.status(404).json({ "resultMessage": "There is no post for current learning space." });
    }

    var comment;
    var commentIndex = 0;
    
    ls.posts[postIndex].comments.forEach(function(check1) {
        if(check1._id == req.body.comment_id){
            comment = check1;
        }
        if(!comment){
            commentIndex++;
        }
    });

    if (!comment) {
        return res.status(404).json({ "resultMessage": "There is no comment for current post." });
    }

    if(req.body.content){
        comment.content = req.body.content;
    }

    if(req.body.images){
        comment.images = req.body.images;
    }

    ls.posts[postIndex].comments[commentIndex] = comment;
    console.log(ls.posts[postIndex].comments[commentIndex])
    await ls.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save post to DB" });
    });

    return res.status(200).json({
        resultMessage: "Comment is succesfully updated.",
        Comment: comment
    });

    };