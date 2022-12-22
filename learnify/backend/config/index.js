import { config } from 'dotenv';
config();

//NOTE: If you are running the project in an instance, you should store these secret keys in its configuration settings.
const { PORT, NODE_ENV, DB_URI, MAIL, MAIL_PASS, JWT_KEY ,SEMANTIC_URI, LEARNIFY_DOCKER_DB_URI, LEARNIFY_DOCKER_SEMANTIC_SERVER, LEARNIFY_DOCKER_ANNOTATIONS_SERVER} = process.env

export const port = PORT || 3000;
export const env = NODE_ENV;
export const dbUri = LEARNIFY_DOCKER_DB_URI || DB_URI;
export const semantic_server = LEARNIFY_DOCKER_SEMANTIC_SERVER || SEMANTIC_URI
export const annotations_server = LEARNIFY_DOCKER_ANNOTATIONS_SERVER || "http://localhost:5000"
export const mail = MAIL;
export const mail_pass = MAIL_PASS;
export const jwt_key = JWT_KEY;
export const prefix = '';