import mongoose from 'mongoose';

const { Schema, model } = mongoose;


const annotationSchema = new Schema({
 "@context": {type: String, required: true, default: "http://www.w3.org/ns/anno.jsonld"},
  _id: {
    type: String, required: true
  },
  type: {type: String, required: true, default: "Annotation"},
  body: {type: String, required: true},
  creator: {type: String, required: true},
  target: {
    type: Schema.Types.Mixed, 
    required: true},
},
{_id: false},
  {
    timestamps: true,
    toJSON: {
      transform: function (doc, ret, options) {

        ret.id = ret._id;
        delete ret.BERT;
        delete ret._id;
        return ret;
      },
      virtuals: true,
    },
    versionKey: false,
  });

const Annotation = model('Annotation', annotationSchema)
export default Annotation;