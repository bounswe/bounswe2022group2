import expressLoader from './express.js';
import mongooseLoader from './mongoose.js';

export default async (app) => {
  await mongooseLoader();
  expressLoader(app);
}