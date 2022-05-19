import { Router } from 'express';
import { getLessonsByCategory, createLessonEndpoint } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);
router.post('/createLesson', createLessonEndpoint);

export default router