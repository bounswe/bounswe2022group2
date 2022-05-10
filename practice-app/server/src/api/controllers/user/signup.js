import bcrypt from 'bcryptjs';
import { User } from '../../../models/index.js';
import { validateSignup } from '../../validators/user.validator.js';
const { hash } = bcrypt;


export default async (req, res) => {
  const { error } = validateSignup(req.body);
  if (error) {
    return res.status(400).json({ "resultMessage": error.details[0].message });
  }

  const exists = await User.exists({ email: req.body.email })
    .catch((err) => {
      return res.status(500).json({ "resultMessage": err.message });
    });

  if (exists) return res.status(409).json({ "resultMessage": "There already exists a user with the given email." });

  const hashed = await hash(req.body.password, 10);

  let user = new User({
    email: req.body.email,
    password: hashed,
    name: req.body.name,
  });

  user = await user.save().catch((err) => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  return res.status(200).json({
    resultMessage: "User is successfully signed up.", user: user.toJSON(),
  });
};
