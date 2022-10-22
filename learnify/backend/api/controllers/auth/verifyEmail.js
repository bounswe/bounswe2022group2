import { User } from '../../../models/index.js';


export default async (req, res) => {
    //verify request

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
    const databaseCode = user.code;

    const codeCheck = databaseCode == userCode;

    if (!codeCheck)
        return res.status(400).json({ "resultMessage": "Wrong code." });

    user.is_verified = true
    user = await user.save().catch((err) =>{
        console.log("Could not save user to DB")
        return res.status(500).json({ "resultMessage": err.message });
      });

    return res.status(200).json({
        resultMessage: "Successfully verified email.",
        user: user.toJSON(),
    });
};
