import { createRating} from "./createRating.js";

export default async (req, res) => {
    try {
        const {resultMessage, rating} = await createRating(req.body);
        let status = 200;
        if(resultMessage == "Rating already exists.")
            status = 409;
        return res.status(status).json({"resultMessage": resultMessage, "rating": rating});
    }catch(err) {
        let status = 500;
        return res.status(status).json({ "resultMessage": err.message });
    }
};