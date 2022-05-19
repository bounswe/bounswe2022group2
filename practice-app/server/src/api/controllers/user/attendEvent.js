import { User } from '../../../models/index.js';
import { Event } from '../../../models/index.js';
import { validateAttendEvent } from '../../validators/user.validator.js';

export default async (req, res) => {

  const { error } = validateAttendEvent(req.body);

  if (error) {
    return res.status(400).json({ "resultMessage": error.details[0].message });
  }

  const userId = req.body.user_id;
  const eventId = req.body.event_id;

  const event = await Event.findById(eventId)
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  if(!event) return res.status(404).json({"resultMessage": "The event with the given id could not be found"});

  let user = await User.findById(userId)
  .catch(err => {
    return res.status(500).json({"resultMessage": err.message});
  });

  if(!user) return res.status(404).json({"resultMessage": "The user with the given id could not be found"});

  if(user.attendedEvents.includes(eventId)){
    return res.status(400).json({"resultMessage": "User has already attended this event"});
  }

  user = await User.findByIdAndUpdate(userId, {$push: {attendedEvents: eventId}}, {new:true})
  .catch(err => {
    return res.status(500).json({ "resultMessage": err.message });
  });

  return res.status(200).json({
    resultMessage: "Event is successfully attended.", user: user, event: event
  });

}
