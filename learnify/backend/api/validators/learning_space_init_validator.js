import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    name: Joi.string().email().min(3).required(),
    topic: Joi.string().min(6).max(20).required(),
  });
  return schema.validate(body);
}