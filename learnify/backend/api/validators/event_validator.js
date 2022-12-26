import Joi from 'joi';

export function validateEvent(body){
  
    const eventValidator = Joi.object({
      date: Joi.date().required().required(),
      description: Joi.string(),
      title: Joi.string().required(),
      duration: Joi.number().required(),
      participationLimit: Joi.number().required(),
      geolocation: Joi.object({
      accuracy: Joi.number().required(),
      latitude: Joi.number().required(),
      longitude: Joi.number().required().required()
    }),
      lsId: Joi.string().required()
    });
    return eventValidator.validate(body);
  }