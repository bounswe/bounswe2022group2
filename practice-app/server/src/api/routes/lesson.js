import { Router } from 'express';
import { getLessonsByCategory, createLessonEndpoint } from '../controllers/lesson/index.js';
import { getLessonsByCategory } from '../controllers/lesson/index.js';
import { getLessonsByName } from '../controllers/lesson/index.js';
import { getLessonEvents } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);
router.post('/createLesson', createLessonEndpoint);
router.get('/byName', getLessonsByName);
router.get('/events', getLessonEvents);

export default router