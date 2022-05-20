import { Router } from 'express';
import category from './category.js';
import event from './event.js';
import lesson from './lesson.js';
import rating from './rating.js';
import user from './user.js';

const router = Router();

router.use('/user', user);
router.use('/lesson', lesson);
router.use('/category', category);
router.use('/event', event);
router.use('/rating', rating);

export default router;
