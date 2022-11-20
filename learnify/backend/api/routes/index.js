import { Router } from 'express';
import  auth from './auth.js';
import learning_space from './learning_space.js'

const router = Router();

router.use('/auth', auth);
router.use('/learningspace', learning_space);


export default router;