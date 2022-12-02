import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    description: Joi.string().min(6).max(2000).required(),
    icon: Joi.number().min(0).max(20),
    categories: Joi.array().required()
  });
  return schema.validate(body);
}
export function validateAnnotation_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    post_id: Joi.string().min(6).max(2000).required(),
    body: Joi.string().required(),
    target: Joi.object().required(),
  });
  return schema.validate(body);
}
export function validatePost_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    title: Joi.string().min(3).required(),
    content: Joi.string().min(6).required(),
  });
  return schema.validate(body);
}
export function validateEditPost_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    post_id: Joi.string().min(3).required(),
  });
  return schema.validate(body);
}
export function validateLSEnroll_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required()
  });
  return schema.validate(body);
}