import { Router } from 'express';

import { 
    post_learningSpace ,
    post_enrollLearningSpace, 
    semanti_search_ls, 
    get_learning_space_by_id, 
    get_learning_space_by_category, 
    post_create_comment, 
    post_create_post, 
    put_edit_post, 
    put_edit_comment,
    get_by_participation,
    get_by_creator,
    put_vote_post
} from '../controllers/learning_space/index.js';


const router = Router();

router.get('/:id', get_learning_space_by_id)
router.get('/category/:category', get_learning_space_by_category)
router.post('/', post_learningSpace)
router.post('/enroll', post_enrollLearningSpace)
router.put('/edit/comment', put_edit_comment)
router.post('/post', post_create_post)
router.post('/comment', post_create_comment)
router.put('/edit/post', put_edit_post)
router.put('/post/vote', put_vote_post)
router.get('/', semanti_search_ls)
router.get('/user/participated', get_by_participation)
router.get('/user/created', get_by_creator)


export default router;