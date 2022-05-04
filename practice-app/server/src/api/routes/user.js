import { Router } from 'express';
import { signup } from '../controllers/user/index.js';

const router = Router();

// Auth
router.post('/signup', signup);

export default router