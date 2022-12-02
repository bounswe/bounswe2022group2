import { Router } from 'express';

import { get_courses, post_learningSpace , semanti_search_ls, get_learning_space_by_id, get_learning_space_by_category, post_create_post} from '../controllers/learning_space/index.js';

import { get_courses, post_learningSpace , semanti_search_ls, get_learning_space_by_id, get_learning_space_by_category, post_enrollLearningSpace} from '../controllers/learning_space/index.js';


const router = Router();

router.get('/', get_courses);
router.get('/:id', get_learning_space_by_id)
router.get('/category/:category', get_learning_space_by_category)
router.post('/', post_learningSpace)
router.post('/post', post_create_post)
router.post('/enroll', post_enrollLearningSpace)
router.get('/', semanti_search_ls)


export default router;