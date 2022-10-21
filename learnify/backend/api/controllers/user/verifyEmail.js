
import bcrypt from 'bcryptjs';

export default async (req,res) => {
    //verify request

    const email = req.body.email;
    console.log(req)

    // let emailCheck = await User.exists({ email: email})
    //     .catch((err) => {
    //     return res.status(500).json({ "resultMessage": err.message });
    // });

    // if (!emailCheck) 
    //     return res.status(404).json({"resultMessage": "There is no user with the given email."});

    // let user = await User.findOne({ email: email })
    //     .catch((err) => {
    //     return res.status(500).json({ "resultMessage": err.message });
    // });
    
    const userCode = req.body.code;
    // const databaseCode = user.password;
    // const codeCheck = bcrypt.compareSync(userCode, databaseCode);

    // if (!codeCheck) 
    //     return res.status(409).json({"resultMessage": "Wrong code."});

    // user.is_verified = true
    return res.status(200).json({
        resultMessage: "Successfully verified email.",
        // user: user.toJSON(),
        email: email,
        userCode : userCode
    });
};
