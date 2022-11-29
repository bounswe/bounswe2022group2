import { Router } from 'express';
import { get_categories } from '../controllers/categories/index.js';

const router = Router();

router.get('/', get_categories);


export default router;