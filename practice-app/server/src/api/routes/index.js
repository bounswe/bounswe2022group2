import { Router } from 'express';
import lesson from './lesson.js';
import user from './user.js';
const router = Router();

router.use('/user', user);
router.use('/lesson', lesson);

export default router;