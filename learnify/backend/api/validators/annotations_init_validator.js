import Joi from 'joi';

export function validateCreateAnnotation_init(body) {
    const schema = Joi.object({
      "@context": Joi.string().valid('http://www.w3.org/ns/anno.jsonld').required(),
      type: Joi.string().valid('Annotation').required(),
      body: Joi.string().required(),
      target: Joi.object().required(),
    });
    return schema.validate(body);
  }