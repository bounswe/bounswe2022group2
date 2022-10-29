import otpGenerator from 'otp-generator';
import nodemailer from 'nodemailer'; 
import {env, mail, mail_pass} from '../../config/index.js'; 

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: mail,
      pass: mail_pass
    }
  });

export default async (user) => {
  await transporter.verify().then(console.log).catch((err) => {throw err});
    const token = otpGenerator.generate(4, {lowerCaseAlphabets: false, upperCaseAlphabets: false, specialChars: false });

      var mailOptions = {
        from: mail,
        to: user.email,
        subject: 'Learnify 3rd Party Auth',
        text: "Your verification code: " + token
      };
      if(!(env === "test")){
        transporter.sendMail(mailOptions, function(error, info){
          if (error) {
            console.log(error);
            throw error;
          } else {
            console.log('Email sent: ' + info.response);
          }
        });
      }
      user.verification_token = token;
      user = await user.save().catch((err) =>{
        console.log("Could not save user to DB")
        return res.status(500).json({ "resultMessage": err.message });
      });
}