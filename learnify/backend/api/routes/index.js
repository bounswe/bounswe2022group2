import { Router } from 'express';
import  auth from './auth.js';
import learning_space from './learning_space.js'
import categories from './categories.js';
import user from './user.js'

const router = Router();

router.use('/auth', auth);
router.use('/learningspace', learning_space);
router.use('/categories', categories);
router.use('/user', user);


export default router;