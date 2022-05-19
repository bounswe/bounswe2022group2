import mongoose from 'mongoose';
import { Event } from '../../../models/index.js';
import { User } from '../../../models/index.js';

export default async (req, res) => {

    const user_id = req.query.user_id;
    if (!user_id || !mongoose.Types.ObjectId.isValid(req.query.user_id)) {
        return res.status(400).json({"resultMessage": "Please provide a valid user id."});
    }

    const user = await User.find({ _id: user_id})
        .catch((err) => {
            return res.status(500).json({"resultMessage": err.message});
        });

    if (typeof user[0] == 'undefined') {
        return res.status(400).json({"resultMessage": "Please provide a valid user id."});
    }
    const event_ids = user[0].attendedEvents;

    var events = [];

    for (let i=0; i < event_ids.length; i++) {
        const event = await Event.find({ _id: event_ids[i]})
            .catch((err) => {
                return res.status(500).json({"resultMessage": err.message});
            });
        events[i] = event;
    }
    
    return res.status(200).json({
        resultMessage: "Events are successfully fetched.",
        events: events,
    });
};