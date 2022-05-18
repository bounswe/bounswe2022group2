import mongoose from 'mongoose';
import { Category } from '../../../models/index.js';

export default async (req, res) => {
    const title = req.query.title;
    console.log(title);
    const categories = await Category.find({ title: {$regex:title} })
      .catch((err) => {
        return res.status(500).json({ "resultMessage": err.message });
      });
  
    return res.status(200).json({
      resultMessage: "Categories are successfully filtered by title.",
      categories: categories,
    });
  };