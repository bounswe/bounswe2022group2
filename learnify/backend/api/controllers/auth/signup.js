import bcrypt from 'bcryptjs';
import { User } from '../../../models/index.js';
import { validateSignup } from '../../validators/user_validator.js';
import send_verification_email from '../../../utils/auth/send_verification_email.js'
const { hash } = bcrypt;

export default async (req, res) => {
  const { error } = validateSignup(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": error.details[0].message });
  }
  
  const exists_email = await User.exists({ email: req.body.email })
    .catch((err) => {
      console.log("Could not fetch users from mongoDB")
      return res.status(500).json({ "resultMessage": err.message });
    });
  
  if (exists_email) {
    console.log("User with existing email tried to signup")
    return res.status(409).json({ "resultMessage": "There already exists a user with the given email." });
  }
  const exists_username = await User.exists({ username: req.body.username })
  .catch((err) => {
    console.log("Could not fetch users from mongoDB")
    return res.status(500).json({ "resultMessage": err.message });
  });

  if (exists_username) {
  console.log("User with existing username tried to signup")
  return res.status(409).json({ "resultMessage": "There already exists a user with the given username." });
  }

  const hashed = await hash(req.body.password, 10);

  let user = new User({
    email: req.body.email,
    password: hashed,
    username: req.body.username,
  });

  try{
    await send_verification_email(user);
  }catch(err){
    console.log("Could not send verification email.")
    return res.status(500).json({ "resultMessage": err.message });
  }
  return res.status(200).json({
    resultMessage: "User is successfully signed up."
  });
};