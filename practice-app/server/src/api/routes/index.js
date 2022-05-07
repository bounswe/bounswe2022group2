import { Router } from 'express';
import category from './category.js';

const router = Router();

router.use('/category', category);
export default router;