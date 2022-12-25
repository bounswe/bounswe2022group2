
import axios from "axios";
import { annotations_server } from "../../../config/index.js";

import { LearningSpace } from '../../../models/index.js';

export default async (req, res) => {

    let ls = await LearningSpace.findOne({_id: req.params.ls_id})
      .catch((err) => {
        console.log(err.message);
        return res.status(500).json({ "resultMessage": "Something is wrong." });
      });

    if (!ls) {
      const err = "There is no learning space with given ID"
      console.log(err)
      return res.status(409).json({ "resultMessage": err });
    }

    let post = ls.posts.find(element => String(element.id) == req.params.post_id);

    if (!post) {
      const err = "There is no post with given id"
      console.log(err)
      return res.status(409).json({ "resultMessage": err });
    }


  var response = await axios.get(annotations_server + `/annotations/get/${req.params.ls_id}/${req.params.post_id}`).catch((error) => {
    return res.status(error.response.status).json({
      resultMessage: error.response.data.resultMessage,
    });
  });

  if(response.status == 200){
    return res.status(response.status).json({
      annotations: response.data.annotations
    });
  }
};