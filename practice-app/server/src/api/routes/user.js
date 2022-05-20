import { Router } from 'express';
import { signup } from '../controllers/user/index.js';
import { login } from '../controllers/user/index.js';
import { dropLesson } from "../controllers/user/index.js";
import { enrollLesson } from "../controllers/user/index.js";
import { attendEvent } from "../controllers/user/index.js";
import { getAttendedEvents } from '../controllers/user/index.js';
import { getEnrolledLessons } from '../controllers/user/index.js';


const router = Router();

// Auth
router.post('/signup', signup);
router.post('/login', login);
router.post("/enrolled/drop", dropLesson);
router.post("/enroll", enrollLesson);
router.post("/attend", attendEvent);
router.get('/attendedEvents', getAttendedEvents);


export default router
