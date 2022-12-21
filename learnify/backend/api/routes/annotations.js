import { Router } from 'express';
import { getAnnotationsByLsPostId } from '../annotation_service/controllers/index.js';

const router = Router();

router.get('/get/:ls_id/:post_id', getAnnotationsByLsPostId);

export default router;