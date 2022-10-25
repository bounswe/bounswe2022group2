import { config } from 'dotenv';
config();

//NOTE: If you are running the project in an instance, you should store these secret keys in its configuration settings.
const { PORT, NODE_ENV, DB_URI, MAIL, MAIL_PASS, JWT_KEY } = process.env

export const port = PORT || 3000;
export const env = NODE_ENV;
export const dbUri = DB_URI;
export const mail = MAIL;
export const mail_pass = MAIL_PASS;
export const jwt_key = JWT_KEY;
export const prefix = '';