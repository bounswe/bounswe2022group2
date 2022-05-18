import { Router } from 'express';
import { createEventEndpoint } from '../controllers/event/index.js';

const router = Router();

router.post('/createEvent', createEventEndpoint);

export default router