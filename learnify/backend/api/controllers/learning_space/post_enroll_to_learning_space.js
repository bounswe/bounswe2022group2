
import { User } from '../../../models/index.js';
import { LearningSpace } from '../../../models/index.js';
import { validateLSEnroll_init } from '../../validators/learning_space_init_validator.js';

export default async (req, res) => {
  const { error } = validateLSEnroll_init(req.body);
  if (error) {
    console.log(error);
    return res.status(400).json({ "resultMessage": "Please check your inputs."});
  }
  const user = await User.exists({username: req.body.username });
  if(!user){
    const err = "The user with this username does not exist."
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }

  var ls = await LearningSpace.findOne({ title: req.body.title })
    .catch((err) => {
      console.log("Could not fetch learning space from mongoDB")
      console.log(err.message);
      return res.status(500).json({ "resultMessage": "Something is wrong." });
    });

  if(!ls){
    const err = "The learning space with the given title does not exist."
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
  
  if (ls.participants.includes(req.body.username)) {
    const err = "This user is already enrolled in this learning space"
    console.log(err)
    return res.status(409).json({ "resultMessage": err });
  }
    ls.participants.push(req.body.username);
    ls.num_participants += 1;

    ls = await ls.save().catch((err) =>{
    console.log(err.message)
    return res.status(500).json({ "resultMessage": "Could not save ls to DB" });
  });

  return res.status(200).json({
    resultMessage: "User has successfully enrolled.",
    learningSpace: ls
  });
};

