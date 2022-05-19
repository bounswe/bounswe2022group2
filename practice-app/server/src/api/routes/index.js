import { Router } from 'express';
import lesson from './lesson.js';
import user from './user.js';
import category from './category.js';
import event from './event.js';
import rating from './rating.js';

const router = Router();

router.use('/user', user);
router.use('/lesson', lesson);
router.use('/category', category);
router.use('/event', event);
router.use('/rating', rating);

export default router;