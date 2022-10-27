import { Router } from 'express';
import { signup } from '../controllers/auth/index.js';
import { verifyEmail } from '../controllers/auth/index.js';

const router = Router();

router.post('/signup', signup);
router.post('/verifyEmail', verifyEmail);

export default router;