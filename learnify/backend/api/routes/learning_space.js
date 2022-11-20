import { Router } from 'express';
import { get_courses, post_learningSpace } from '../controllers/learning_space/index.js';

const router = Router();

router.get('/', get_courses);
router.post('/', post_learningSpace)


export default router;