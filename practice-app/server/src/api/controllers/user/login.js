import { User } from '../../../models/index.js';
import { validateLogin } from '../../validators/user.validator.js';
import bcrypt from 'bcryptjs';
const { hash } = bcrypt;

export default async (req,res) => {
    const { error } = validateLogin(req.body);
    if (error) 
        return res.status(400).json({ "resultMessage": error.details[0].message });

    const email = req.body.email;
    const password = await hash(req.body.password, 10);

    let emailCheck = await User.exists({ email: email})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    if (!emailCheck) 
        return res.status(404).json({"resultMessage": "There is no user with the given email."});

    let passwordCheck = await User.exists({ email: email, password: password})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    if (!passwordCheck) 
        return res.status(404).json({"resultMessage": "Wrong password."});

    let user = await User.find({ email: email});
    
    return res.status(200).json({
        resultMessage: "Successfully logged in.",
        user: user.toJSON(),
    });
};
