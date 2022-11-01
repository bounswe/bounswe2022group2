import { Router } from 'express';
import  auth from './auth.js';
import courses from './courses.js'

const router = Router();

router.use('/auth', auth);
router.use('/courses', courses);


export default router;