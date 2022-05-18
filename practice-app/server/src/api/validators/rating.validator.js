import Joi from 'joi';

export function validateReqBody(reqBody) {
  const schema = Joi.object({
    lessonID: Joi.string().required(),
    rating: Joi.number().required()
  });
  

  return schema.validate(reqBody);

}
export function validateGetReqBody(reqBody) {
  const schema = Joi.object({
    min: Joi.number().required(),
    max: Joi.number().required()
  });
  return schema.validate(reqBody);

}