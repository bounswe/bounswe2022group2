import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    description: Joi.string().min(6).max(20).required(),
    token: Joi.string().required(),
    icon: Joi.number().min(0).max(20)
  });
  return schema.validate(body);
}

export function validateLSEnroll_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    username: Joi.string().min(3).max(40).required()
  });
  return schema.validate(body);
}