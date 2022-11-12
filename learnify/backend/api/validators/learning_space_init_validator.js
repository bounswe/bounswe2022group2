import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    description: Joi.string().min(6).max(20).required(),
    token: Joi.string().required()
  });
  return schema.validate(body);
}