import { Router } from 'express';
import { createCategory } from '../controllers/category/index.js';

const router = Router();

// Auth
router.post('', createCategory);

export default router