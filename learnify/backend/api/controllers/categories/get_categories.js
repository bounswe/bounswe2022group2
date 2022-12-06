import { Categories} from '../../../models/index.js';

export default async (req, res) => {
    return res.status(200).json({Categories})
}