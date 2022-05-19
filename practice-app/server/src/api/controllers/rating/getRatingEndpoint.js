import { Rating } from '../../../models/index.js';
import { validateGetReqBody } from '../../validators/rating.validator.js';

export default async (req, res) => {
    let status = 200;
    const { error } = validateGetReqBody(req.body);
    if(error) {
        status = 400;
        return res.status(status).json({ "resultMessage": error.message });
    }
    const ratings = await Rating.find({rating: {$gte: req.body.min, $lte: req.body.max}}).catch(err=>{
        return res.status(500).json({ "resultMessage": err.message });
    });
    return res.status(200).json(ratings);
    
};
