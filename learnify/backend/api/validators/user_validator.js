import Joi from 'joi';

export function validateSignup(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(6).max(20).required(),
    username: Joi.string().min(3).max(24).required(),
  });
  return schema.validate(body);
}