

import { Annotation } from '../../../models/index.js';

export default async (req, res) => {

    
    var annotations = await Annotation.find().catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });
    annotations = annotations.filter(annotation => ((annotation.target.source && annotation.target.source.includes(`${req.params.ls_id}/${req.params.post_id}`))
    ||
    (annotation.target.id && annotation.target.id.includes(`${req.params.ls_id}/${req.params.post_id}`))));

    return res.status(200).json({annotations : annotations})

}
