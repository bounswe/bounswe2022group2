import Joi from 'joi';

export function validateEvent(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    date: Joi.date().required(),
    location: Joi.string().min(3).required(),
    host_id: Joi.string().hex().length(24).required(),
    lesson_id: Joi.string().hex().length(24).required()
  });
  return schema.validate(body);
}
