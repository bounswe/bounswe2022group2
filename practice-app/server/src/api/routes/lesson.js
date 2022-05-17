import { Router } from 'express';
import { getLessonsByCategory } from '../controllers/lesson/index.js';
import { getLessonsByName } from '../controllers/lesson/index.js';
import { getLessonEvents } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);
router.get('/byName', getLessonsByName);
router.get('/events', getLessonEvents);

export default router