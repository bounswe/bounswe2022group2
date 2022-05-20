import { Router } from 'express';
import { createLessonEndpoint, getLessonByLecturer, getLessonEvents, getLessonsByCategory, getLessonsByName } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);
router.post('/createLesson', createLessonEndpoint);
router.get('/byName', getLessonsByName);
router.get('/events', getLessonEvents);
router.get('/byLecturer', getLessonByLecturer);

export default router