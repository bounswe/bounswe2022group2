import { Router } from 'express';
import  auth from './auth.js';
import learning_space from './learning_space.js'
import categories from './categories.js';

const router = Router();

router.use('/auth', auth);
router.use('/learningspace', learning_space);
router.use('/categories', categories);


export default router;