import { Router } from 'express';
import { verifyEmail } from '../controllers/index.js';



const router = Router();


router.post('/verifyEmail', verifyEmail);

export default router
