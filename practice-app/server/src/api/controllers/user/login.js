import { User } from '../../../models/index.js';
import { validateLogin } from '../../validators/user.validator.js';
import bcrypt from 'bcryptjs';
const { hash } = bcrypt;

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

    /*
    let passwordCheck = await User.exists({ email: email, password: incomingPassword})
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });

    if (!passwordCheck) 
        return res.status(404).json({"resultMessage": "Wrong password."});
    */
    let user1 = await User.find({ email: email })
        .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
    });
    console.log(user);
    console.log(user.password);
    let user = user1[0];
    const incomingPassword = req.body.password;
    const databasePassword = user.password;

    const passwordCheck = bcrypt.compareSync(incomingPassword, databasePassword);

    if (!passwordCheck) 
        return res.status(404).json({"resultMessage": "Wrong password."});
    
    return res.status(200).json({
        resultMessage: "Successfully logged in.",
        user: user.toJSON(),
    });
};
