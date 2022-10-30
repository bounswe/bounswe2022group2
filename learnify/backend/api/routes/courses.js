import { Router } from 'express';
import { get_courses } from '../controllers/courses/index.js';

const router = Router();

router.get('/', get_courses);


export default router;