import { User, LearningSpace } from '../../../models/index.js';

export default async (username) => {
    var user = await User.findOne({ username: req.params.username })
        .catch((err) => {
            console.log("Could not fetch users from mongoDB")
            console.log(err.message);
            return res.status(500).json({ "resultMessage": "User does not exists" });
        });

    if (!user) {
        console.log("User with given username does not exists")
        return res.status(409).json({ "resultMessage": "User with given username does not exists" });
    }
    var profile = user.toJSON();
    delete profile.email;
    delete profile.id;

    var participated = await LearningSpace.find({"participants" :{"$all": [username]}}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });
    var created = await LearningSpace.find({"participants" :{"$all": [username]}}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });
    return profile;
}