import { Router } from 'express';
import { createCategoryEndpoint } from '../controllers/category/index.js';
import { getCategoryEndpoint } from '../controllers/category/index.js';

const router = Router();

router.post('', createCategoryEndpoint);
router.get('', getCategoryEndpoint);

export default router