import mongoose from 'mongoose';


// export class TextSelector{
//     constructor(type, start, end){
//         this.type = type;
//         this.start = start;
//         this.end = end;

//     }
// }

// export class ImageSelector{
//     constructor(id, type, format){
//         this.id = id;
//         this.type = type;
//         this.format = format;
//     }
// }

// export class Target{
//     constructor(source, selector){
//         this.source = source;
//         this.selector = selector;
//     }


// }


const { Schema, model } = mongoose;


const annotationSchema = new Schema({
 "@context": {type: String, required: true, default: "http://www.w3.org/ns/anno.jsonld"},
  _id: {
    type: String, required: true
  },
  type: {type: String, required: true, default: "Annotation"},
  body: {type: String, required: true},
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