import { createEvent } from "./createEvent.js";

export default async (req, res) => {
    try {
        const {resultMessage, event} = await createEvent(req.body.title, req.body.date, req.body.location, req.body.host_id, req.body.lesson_id);
        let status = 200;
        console.log(resultMessage);
        return res.status(status).json({"resultMessage": resultMessage, "event": event});
    }catch(err) {
        let status = 500;
        if(err.message == "\"title\" length must be at least 3 characters long")
            status = 400;
        if(err.message == "\"date\" must be a valid date")
            status = 400;
        if(err.message == "\"title\" is required" || err.message == "\"date\" is required" || err.message == "\"location\" is required" || err.message == "\"host_id\" is required" || err.message == "\"lesson_id\" is required")
            status = 400;
        if(err.message == "Invalid address")
            status = 400;
        if(err.message == "Date cannot be below the current period.")
            status = 400;
        if (err.message == "Lesson does not exist.")
            status = 404;
        if(err.message == "Cannot generate request for now")
            status = 503;
        return res.status(status).json({ "resultMessage": err.message });
    }
};