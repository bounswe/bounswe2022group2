
import axios from "axios";
import { annotations_server } from "../../../config/index.js";

import jwt from "jsonwebtoken";
import { LearningSpace } from '../../../models/index.js';

export default async (req, res) => {
  var username;
  try {
    const authHeader = req.headers.authorization;
    username = jwt.decode(authHeader).username;
  } catch (e) {
    return res.status(401).json({ "resultMessage": "There is something wrong with your auth token." });
  }



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


  var response = await axios.post(annotations_server + `/annotations/create/${req.params.ls_id}/${req.params.post_id}`  , req.body, {
    headers: {
      'Authorization':req.headers.authorization
    }
  }).catch((error) => {
    console.log(error)
    return res.status(error.response.status).json({
      resultMessage: error.response.data.resultMessage,
    });
  });

  if(response.status == 200){
    return res.status(response.status).json({
      resultMessage: response.data.resultMessage,
      annotation: response.data.annotation
    });
  }
};