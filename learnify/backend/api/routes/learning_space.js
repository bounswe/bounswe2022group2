import { Router } from 'express';
import { get_courses, post_learningSpace, post_enrollLearningSpace } from '../controllers/learning_space/index.js';

const router = Router();

router.get('/', get_courses);
router.post('/', post_learningSpace)
router.post('/enroll', post_enrollLearningSpace)


export default router;