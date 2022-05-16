import { Router } from 'express';
import { getLessonsByCategory } from '../controllers/lesson/index.js';
import { getLessonEvents } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);
router.get('/events/:lesson_id', getLessonEvents);

export default router