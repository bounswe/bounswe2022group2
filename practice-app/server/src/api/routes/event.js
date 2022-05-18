import { Router } from 'express';
import { getEventDetails } from '../controllers/event/index.js';


const router = Router();

router.get("/details", getEventDetails);

export default router
