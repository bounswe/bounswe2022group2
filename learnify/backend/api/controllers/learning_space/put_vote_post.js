
import { LearningSpace } from '../../../models/index.js';
import jwt from "jsonwebtoken";
import { validateVotePost_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
    var username;
    try {
        const authHeader = req.headers.authorization;
        username = jwt.decode(authHeader).username;
    } catch (e) {
        return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
    }



    const { error } = validateVotePost_init(req.body);
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
        return res.status(404).json({ "resultMessage": "There is no learning space with given ID." });
    }
    
    if(ls.posts){
        var post = ls.posts.find(element => element._id == req.body.post_id);
    }
    if(!post){
        return res.status(404).json({ "resultMessage": "There is no post with given ID." });
    }

    var index = ls.posts.indexOf(post);

    if(req.body.type == "upvote"){
        post.upvote += 1;
    }

    if(req.body.type == "downvote"){
        post.downvote += 1;
    }


    ls.posts[index] = post;
    await ls.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
    });

    return res.status(200).json({
        resultMessage: "Post is succesfully updated.",
        post: post
    });
};