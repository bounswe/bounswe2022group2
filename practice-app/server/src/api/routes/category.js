import { Router } from 'express';
import { createCategoryEndpoint } from '../controllers/category/index.js';

const router = Router();

router.post('', createCategoryEndpoint);

export default router