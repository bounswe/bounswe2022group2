import Joi from 'joi';

export function validateSignup(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(6).max(20).required(),
    username: Joi.string().min(3).max(24).required(),
  });
  return schema.validate(body);
}

export function validateLogin(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(6).max(20).required(),
  });
  return schema.validate(body);
}
export function validateVerifyEmail(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    code: Joi.string().min(3).max(400).required(),
  });
  return schema.validate(body);
}
export function validateUpdateProfile(body) {
  const schema = Joi.object({
    bio: Joi.string().min(3),
    profile_picture: Joi.string().base64().min(3).max(400),
  });
  return schema.validate(body);
}
