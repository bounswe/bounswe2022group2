import { LearningSpace } from '../../../models/index.js';
export default async (req, res) => {

    var username;
    console.log(req.headers);
    try{
      const authHeader = req.headers.authorization;
      username = jwt.decode(authHeader).username;
    }catch(e){
      return res.status(401).json({ "resultMessage": "There is something wrong with your auth token."});
    }

    var ls = await LearningSpace.find({"participants" :{"$in": [username]}}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });

    return res.status(200).json({learning_spaces : ls})

}