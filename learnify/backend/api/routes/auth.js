import { Router } from 'express';
import { signup } from '../controllers/auth/index.js';

const router = Router();

router.post('/signup', signup);

export default router;