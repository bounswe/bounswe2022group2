
import { LearningSpace } from '../../../models/index.js';
import { Comment } from '../../../models/index.js';
import jwt from "jsonwebtoken";
import { validateComment_init } from '../../validators/learning_space_init_validator.js';



export default async (req, res) => {
    var username;
    try {
        const authHeader = req.headers.authorization;
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
    var numCheck = 0;
        ls.posts.forEach(function(check) {
            if(check._id == req.body.post_id){
                post = check;
            }
            if(!post){
                numCheck++;
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
        comment.images = req.body.images;
    }

    ls.posts[numCheck].comments.push(comment);
    console.log(ls.posts[numCheck].comments)
    await ls.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save post to DB" });
    });

    return res.status(200).json({
        resultMessage: "Comment is succesfully created.",
        Comment: comment
    });

    };