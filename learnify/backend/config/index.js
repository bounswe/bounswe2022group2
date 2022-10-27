import { config } from 'dotenv';
config();

//NOTE: If you are running the project in an instance, you should store these secret keys in its configuration settings.
const { PORT, NODE_ENV, DB_URI } = process.env

export const port = PORT || 3000;
export const env = NODE_ENV;
export const dbUri = DB_URI;

export const prefix = '';