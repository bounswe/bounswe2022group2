import { createCategory } from "./createCategory.js";

export default async (req, res) => {
    try {
        const {resultMessage, category} = await createCategory(req.body.title);
        let status = 200;
        if(resultMessage == "Category already exists.")
            status = 409;
        return res.status(status).json({"resultMessage": resultMessage, "category": category});
    }catch(err) {
        let status = 500;
        if(err.message == "\"title\" length must be at least 5 characters long")
            status = 400;
    
        return res.status(status).json({ "resultMessage": err.message });
    }
};