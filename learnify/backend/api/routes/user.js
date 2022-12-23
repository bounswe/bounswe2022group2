import { Router } from 'express';
import { get_user_profile, update_profile } from '../controllers/user/index.js';

const router = Router();

router.put('/', update_profile);
router.get('/:username', get_user_profile);


export default router;