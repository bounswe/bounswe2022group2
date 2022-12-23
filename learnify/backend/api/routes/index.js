import { Router } from 'express';
import  auth from './auth.js';
import learning_space from './learning_space.js'
import categories from './categories.js';
import user from './user.js'
import annotations from './annotations-service.js';
import event from './event.js'



const router = Router();

router.use('/auth', auth);
router.use('/learningspace', learning_space);
router.use('/categories', categories);
router.use('/user', user);
router.use('/annotations-service', annotations);
router.use('/events', event);



export default router;