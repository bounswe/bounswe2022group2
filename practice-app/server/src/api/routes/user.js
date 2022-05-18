import { Router } from 'express';
import { signup } from '../controllers/user/index.js';
import { dropLesson } from "../controllers/user/index.js";
<<<<<<< Updated upstream
=======
import { attendEvent } from "../controllers/user/index.js";
import { getAttendedEvents } from '../controllers/user/index.js';
import { enrollLesson } from "../controllers/user/index.js";
>>>>>>> Stashed changes

const router = Router();

// Auth
router.post('/signup', signup);
router.post("/enrolled/drop", dropLesson);
<<<<<<< Updated upstream
=======
router.post("/attend", attendEvent);
router.get('/attendedEvents', getAttendedEvents);
router.post("/enroll", enrollLesson);
>>>>>>> Stashed changes

export default router