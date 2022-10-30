import { User } from '../../../models/index.js';
import send_verification_email from '../../../utils/auth/send_verification_email.js'

export default async (req, res) => {

    const email = req.body.email;

    let user = await User.findOne({ email: email })
        .catch((err) => {
            console.log(err.message);
            return res.status(500).json({ "resultMessage": "Something is wrong." });
        });

    try{
        await send_verification_email(user);
    }catch(err){
        console.log(err.message);
        return res.status(500).json({ "resultMessage": "Could not send verification email." });
    }
    return res.status(200).json({
        resultMessage: "Verification code is succesfully resended."
    });
};   
    