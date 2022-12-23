import { User, LearningSpace } from '../../models/index.js';

export default async (res, username) => {
    var user = await User.findOne({ username: username })
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

    var participated = await LearningSpace.find({"participants" :{"$all": [username]}, "creator" :{"$ne": username}}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });
    var created = await LearningSpace.find({"creator" : username, }).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });

    
    profile.created = created;
    profile.participated = participated;
    return res.status(200).json(profile);
}