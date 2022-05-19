import mongoose from 'mongoose';
import { Event} from '../../../models/index.js';

export default async (req,res) => {
    const eventId = req.query.event_id;
    if(!eventId || !mongoose.isValidObjectId(req.query.event_id)) {
        return res.status(400).json({ "resultMessage": "Please provide a valid event id." });
    }

    const event = await Event.findById(eventId)
    .catch(err => {
        return res.status(500).json({"resultMessage": err.message});
    });

    if(!event) return res.status(404).json({"resultMessage": "Event with the given event id does not exist"});

    return res.status(200).json({
        resultMessage: "Event is successfully fetched.",
        event: event,
    });
} 
