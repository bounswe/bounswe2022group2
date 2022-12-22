import mongoose from 'mongoose';
import { dbUri, env } from '../config/index.js';
import { MongoMemoryServer } from "mongodb-memory-server-core";


export default async () => {
  console.log("database url: ", dbUri)
  if (env == "test") {
    const mongoServer = await MongoMemoryServer.create();
    await mongoose.connect(mongoServer.getUri());
  } else {

    await mongoose.connect(dbUri,
      {
        useNewUrlParser: true,
        useUnifiedTopology: true
      }
    )
      .then(() => {
        console.log('Mongodb Connection');
      })
      .catch(err => {
        console.log(err);
      });
  }
};