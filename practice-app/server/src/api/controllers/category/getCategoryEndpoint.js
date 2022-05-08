import { Category } from '../../../models/index.js';

export default async (req, res) => {
    
    const categories = await Category.find().catch(err=>{
        return res.status(500).json({ "resultMessage": err.message });
    });

    return res.status(200).json(categories);

};