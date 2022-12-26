import { Router } from 'express';
import { get_user_profile, update_profile, get_search_users } from '../controllers/user/index.js';

const router = Router();

router.put('/', update_profile);
router.get('/:username', get_user_profile);
router.get('/search/:username', get_search_users);



export default router;