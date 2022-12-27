import { Event } from '../../../models/index.js';
export default async (req, res) => {


    var events = await Event.find({"lsId" : req.params.id}).catch((err) =>{
        console.log(err.message)
        return res.status(500).json({ "resultMessage": "Error connecting to the DB" });
      });

    return res.status(200).json({events : events})

}