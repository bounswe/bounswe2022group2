import { Router } from 'express';

import { 
create_event,
get_event_by_creation,
get_event_by_learningspace,
get_event_by_participation
} from '../controllers/events/index.js';


const router = Router();

router.post('/', create_event)
router.get('/user/created', get_event_by_creation)
router.get('/user/participated', get_event_by_participation)
router.get('/ls/:id', get_event_by_learningspace)


export default router;