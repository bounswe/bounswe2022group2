import { Router } from 'express';
import { signup } from '../controllers/user/index.js';
import { login } from '../controllers/user/index.js';

const router = Router();

// Auth
router.post('/signup', signup);
router.post('/login', login);

export default router