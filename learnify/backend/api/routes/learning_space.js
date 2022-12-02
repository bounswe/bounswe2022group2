import { Router } from 'express';

import { post_learningSpace ,post_enrollLearningSpace, semanti_search_ls, get_learning_space_by_id, get_learning_space_by_category, post_create_post, post_create_annotation} from '../controllers/learning_space/index.js';

const router = Router();

router.get('/:id', get_learning_space_by_id)
router.get('/category/:category', get_learning_space_by_category)
router.post('/', post_learningSpace)
router.post('/enroll', post_enrollLearningSpace)
router.post('/annotation', post_create_annotation)
router.post('/post', post_create_post)
router.get('/', semanti_search_ls)


export default router;