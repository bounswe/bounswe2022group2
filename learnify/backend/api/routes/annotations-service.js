import { Router } from 'express';
import { createAnnotation } from '../controllers/annotation/index.js';

const router = Router();

router.post('/create/:ls_id/:post_id', createAnnotation);

export default router;