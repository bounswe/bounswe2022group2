import Joi from 'joi';

export function validateLS_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required(),
    description: Joi.string().min(6).max(2000).required(),
    icon_id: Joi.number().min(0).max(20),
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

export function validateEditAnnotation_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    post_id: Joi.string().min(6).max(2000).required(),
    annotation_id: Joi.string().required(),
    target: Joi.object().required(),
    body:Joi.string()
  });
  return schema.validate(body);
}
export function validatePost_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    title: Joi.string().min(3).required(),
    content: Joi.string().min(6).required(),
    images: Joi.array()
  });
  return schema.validate(body);
}
export function validateEditPost_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    post_id: Joi.string().min(3).required(),
    title: Joi.string(),
    content: Joi.string(),
    images:Joi.array()
  });
  return schema.validate(body);
}
export function validateLSEnroll_init(body) {
  const schema = Joi.object({
    title: Joi.string().min(3).required()
  });
  return schema.validate(body);
}
export function validateComment_init(body) {
  const schema = Joi.object({
    post_id: Joi.string().min(3).required(),
    ls_id: Joi.string().min(3).required(),
    content: Joi.string().min(6).required(),
    token: Joi.string().min(6).max(2000).required(),
    images: Joi.array()
  });
  return schema.validate(body);
}