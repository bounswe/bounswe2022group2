import Joi from 'joi';

export function validateEvent(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    date: Joi.date().required(),
    location: Joi.string().min(3).required()
  });
  return schema.validate(body);
}