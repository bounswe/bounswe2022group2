
import Annotation from '../../models/annotation.js';
import jwt from "jsonwebtoken";
import { validateCreateAnnotation_init } from '../validators/annotations_init_validator.js';

export default async (req, res) => {
    var username;
    try {
        const authHeader = req.headers.authorization;
        username = jwt.decode(authHeader).username;
    } catch (e) {
        return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
    }

    const { error } = validateCreateAnnotation_init(req.body);
    if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
    }

    let rgx = /[0-9]+$/;
    let annotations = await Annotation.find();
    let matches = (String(annotations.slice(-1)[0].id)).match(rgx);
    let count = parseInt(matches[0]);
    let id = `http://frontURL/${req.params.ls_id}/${req.params.post_id}/anno${count + 1}`;

    let annotation = new Annotation({
        _id: id,
        type: req.body.type,
        body: req.body.body,
        creator: username,
        target: req.body.target
    });

    await annotation.save().catch((err) => {
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Could not save annotation to DB" });
    });


    return res.status(200).json({
        resultMessage: "Annotation is succesfully created.",
        annotation: annotation
    });
};