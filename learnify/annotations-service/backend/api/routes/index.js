import { Router } from 'express';
import annotations from './annotations.js';

const router = Router();

router.use('/annotations', annotations);


export default router;