import { Router } from 'express';
import { update_profile } from '../controllers/user/index.js';

const router = Router();

router.put('/', update_profile);


export default router;