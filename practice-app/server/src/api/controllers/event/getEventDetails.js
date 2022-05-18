import { User } from '../../../models/index.js';
import { Event } from '../../../models/index.js';
import { validateGetEvent } from '../../validators/event.validator.js';

export default async (req, res) => {

  const { error } = validateGetEvent(req.body);

  if (error) {
    return res.status(400).json({ "resultMessage": error.details[0].message });
  }

  const eventId = req.body.event_id;

  const event = await Event.findById(eventId)
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  if(!event) return res.status(404).json({"resultMessage": "The event with the given id could not be found"});

  return res.status(200).json({
    resultMessage: "Event is successfully fetched.", event: event
  });

}
