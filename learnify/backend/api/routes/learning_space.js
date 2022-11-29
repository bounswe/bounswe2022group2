import { Router } from 'express';
import { get_courses, post_learningSpace, semanti_search_ls } from '../controllers/learning_space/index.js';

const router = Router();

router.post('/', post_learningSpace)
router.get('/', semanti_search_ls)


export default router;