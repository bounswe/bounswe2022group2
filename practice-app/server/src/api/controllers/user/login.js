import { User } from '../../../models/index.js';
import { validateLogin } from '../../validators/user.validator.js';
import bcrypt from 'bcryptjs';

export default async (req,res) => {
    const { error } = validateLogin(req.body);
    if (error) 
        return res.status(400).json({ "resultMessage": error.details[0].message });

    const email = req.body.email;

    let emailCheck = await User.exists({ email: email})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    if (!emailCheck) 
        return res.status(404).json({"resultMessage": "There is no user with the given email."});

    let user = await User.findOne({ email: email }).select('+password')
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });
    
    const incomingPassword = req.body.password;
    const databasePassword = user.password;
    const passwordCheck = bcrypt.compareSync(incomingPassword, databasePassword);

    if (!passwordCheck) 
        return res.status(409).json({"resultMessage": "Wrong password."});

    return res.status(200).json({
        resultMessage: "Successfully logged in.",
        user: user.toJSON(),
    });
};
