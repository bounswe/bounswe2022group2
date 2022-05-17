import { Router } from 'express';
import { createRatingEndpoint } from '../controllers/rating/index.js';
import { getRatingEndpoint } from '../controllers/rating/index.js';

const router = Router();

router.post('', createRatingEndpoint);
router.get('', getRatingEndpoint);

export default router