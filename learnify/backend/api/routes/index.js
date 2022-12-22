import { Router } from 'express';
import  auth from './auth.js';
import learning_space from './learning_space.js'
import categories from './categories.js';
import annotations from './annotations.js';

const router = Router();

router.use('/auth', auth);
router.use('/learningspace', learning_space);
router.use('/categories', categories);
//router.use('/annotations', annotations);


export default router;