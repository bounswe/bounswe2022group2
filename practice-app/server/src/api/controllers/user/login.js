import { User } from '../../../models/index.js';
import { validateLogin } from '../../validators/user.validator.js';
import bcrypt from 'bcryptjs';
const { hash } = bcrypt;

export default async (req,res) => {
    const { error } = validateLogin(req.body);
    if (error) 
        return res.status(400).json({ "resultMessage": error.details[0].message });

    let email = req.body.email;
    let password = req.body.password;
    let hashedPassword = hash(password, 10);

    const exists = await User.exists({ email: email})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    if (!exists) 
        return res.status(404).json({"resultMessage": "There is no user with the given email."});

    const actualHashedPassword = await User.find({ email: email })
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });
        
    if (hashedPassword != actualHashedPassword) 
        return res.status(409).json({ "resultMessage": err.message });

    const user = await User.find({ email: email})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    return res.status(200).json({
        resultMessage: "Successfully logged in.",
        user: user,
    });
};
