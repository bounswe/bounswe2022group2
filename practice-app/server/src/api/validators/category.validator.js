import Joi from 'joi';

export function validateCategory(body) {
  const schema = Joi.object({
    title: Joi.string().min(5).required()
  });
  return schema.validate(body);
}