import { Router } from 'express';
import { signup } from '../controllers/auth/index.js';
import { login } from '../controllers/auth/index.js';

const router = Router();

router.post('/signup', signup);
router.post('/login', login);

export default router;