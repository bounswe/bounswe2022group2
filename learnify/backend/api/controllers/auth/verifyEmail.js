import jwt from "jsonwebtoken";
import { User } from '../../../models/index.js';
import { validateVerifyEmail } from '../../validators/user_validator.js';

export default async (req, res) => {
    const { error } = validateVerifyEmail(req.body);
    if (error) {
      console.log(error);
      return res.status(400).json({ "resultMessage": error.details[0].message });
    }

    const email = req.body.email;
    console.log(email)


    let emailCheck = await User.exists({ email: email })
        .catch((err) => {
            return res.status(500).json({ "resultMessage": err.message });
        });

    if (!emailCheck)
        return res.status(404).json({ "resultMessage": "There is no user with the given email." });

    let user = await User.findOne({ email: email })
        .catch((err) => {
            return res.status(500).json({ "resultMessage": err.message });
        });

    
    
    const userCode = req.body.code;
    const databaseCode = user.verification_code;

    const codeCheck = databaseCode === userCode;

    if (!codeCheck)
        return res.status(400).json({ "resultMessage": "Wrong code." });

    const token = jwt.sign(
        { user_id: user._id, email },
        process.env.JWT_KEY,
        {
            expiresIn: 600,
        }
        );
    user.is_verified = true
    user = await user.save().catch((err) =>{
        console.log("Could not save user to DB")
        return res.status(500).json({ "resultMessage": err.message });
      });

    return res.status(200).json({
        resultMessage: "Successfully verified email.",
        token: token,
        user: user.toJSON(),
        
    });
};
