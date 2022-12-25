import jwt from "jsonwebtoken";
import { User } from '../../../models/index.js';
import { validateUpdateProfile } from '../../validators/user_validator.js';
import get_user_profile from '../../../utils/user/get_user_profile.js';



export default async (req, res) => {
    var username;
    try{
      const authHeader = req.headers.authorization;
      username = jwt.decode(authHeader).username;
    }catch(e){
      return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
    }

  const { error } = validateUpdateProfile(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }
  
  var user = await User.findOne({ username: username })
    .catch((err) => {
      console.log("Could not fetch users from mongoDB")
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "User does not exists" });
    });
  
  if (! user) {
    console.log("User with given username does not exists")
    return res.status(409).json({ "resultMessage": "User with given username does not exists" });
  }

  if(req.body.bio)
  user.bio = req.body.bio;
  if(req.body.profile_picture)
  user.profile_picture = req.body.profile_picture;

  await user.save().catch((err) => {
      console.log(err.message)
      return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });
  return await get_user_profile(res, username)

};