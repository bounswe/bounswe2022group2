import { Router } from 'express';
import { createAnnotation } from '../controllers/index.js';
import { getAnnotations } from '../controllers/index.js';

const router = Router();

router.post('/create/:ls_id/:post_id', createAnnotation);
router.get('/get/:ls_id/:post_id', getAnnotations);

export default router;