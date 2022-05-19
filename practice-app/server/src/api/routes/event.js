import { Router } from 'express';
import { createEventEndpoint } from '../controllers/event/index.js';
import { getEventDetails } from '../controllers/event/index.js';

const router = Router();

router.post('/createEvent', createEventEndpoint);

router.get("/details", getEventDetails);

export default router