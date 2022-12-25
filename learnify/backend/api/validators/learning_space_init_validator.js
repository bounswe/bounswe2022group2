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

export function validateVotePost_init(body) {
  const schema = Joi.object({
    ls_id: Joi.string().min(3).required(),
    post_id: Joi.string().min(3).required(),
    type: Joi.string().valid('upvote', 'downvote').required(),
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
    images: Joi.array()
  });
  return schema.validate(body);
}

