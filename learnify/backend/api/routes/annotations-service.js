import { Router } from 'express';
import { createAnnotation } from '../controllers/annotation/index.js';

const router = Router();

router.post('/create', createAnnotation);

export default router;