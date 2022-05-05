import { Router } from 'express';
import { getLessonsByCategory } from '../controllers/lesson/index.js';

const router = Router();

router.get('/byCategory', getLessonsByCategory);

export default router