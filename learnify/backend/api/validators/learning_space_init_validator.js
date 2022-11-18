import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    description: Joi.string().min(6).max(2000).required(),
    token: Joi.string().required(),
    icon: Joi.number().min(0).max(20),
    categories: Joi.array()
  });
  return schema.validate(body);
}