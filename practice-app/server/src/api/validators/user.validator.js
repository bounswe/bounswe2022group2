import Joi from 'joi';

export function validateSignup(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(6).max(20).required(),
    name: Joi.string().min(3).max(24).required(),
  });
  return schema.validate(body);
}

export function validateLogin(body) {
  const schema = Joi.object({
    email: Joi.string().email().min(3).required(),
    password: Joi.string().min(6).max(20).required()
  });
  return schema.validate(body);
}

export function validateDropLesson(body){
  const schema = Joi.object({
    user_id: Joi.string().hex().length(24).required(), //same thing as Joi.objectId(), since there is no such function I use this way instead
    lesson_id: Joi.string().hex().length(24).required()
  });
  return schema.validate(body);
}

export function validateAttendEvent(body){
  const schema = Joi.object({
    user_id: Joi.string().hex().length(24).required(),
    event_id: Joi.string().hex().length(24).required()
  });
  return schema.validate(body);
}

export function validateEnrollLesson(body){
  const schema = Joi.object({
    user_id: Joi.string().hex().length(24).required(),
    lesson_id: Joi.string().hex().length(24).required()
  });
  return schema.validate(body);
}
