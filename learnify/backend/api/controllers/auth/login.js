import { validateLogin } from '../../validators/user_validator.js';
import bcrypt from 'bcryptjs';
import createToken from "../../../utils/auth/prepare_jwt_token.js";
import { User } from '../../../models/index.js';

export default async (req,res) => {
    const { error } = validateLogin(req.body);
    if (error) {
        console.log(error.details[0].message);
        return res.status(400).json({ "resultMessage": "Please check your inputs." });
    }

    const email = req.body.email;

    let emailCheck = await User.exists({ email: email})
        .catch((err) => {
        console.log(err.message);
        return res.status(500).json({ "resultMessage":  "Something is wrong."});
    });

    if (!emailCheck) 
        return res.status(404).json({"resultMessage": "There is no user with the given email."});

    let user = await User.findOne({ email: email }).select('+password')
        .catch((err) => {
        console.log(err.message);
        return res.status(500).json({ "resultMessage": "Something is wrong." });
    });

    
    const incomingPassword = req.body.password;
    const databasePassword = user.password;
    const passwordCheck = bcrypt.compareSync(incomingPassword, databasePassword);

    if (!passwordCheck) 
        return res.status(409).json({"resultMessage": "Wrong password."});

    if(!user.is_verified){
        return res.status(401).json({
            resultMessage: "User is not verified.",
            user: user.toJSON(),
        });
    }
    
    const token = createToken(user);
        
    return res.status(200).json({
        resultMessage: "Successfully logged in.",
        user: user.toJSON(),
        token: token
    });
};
