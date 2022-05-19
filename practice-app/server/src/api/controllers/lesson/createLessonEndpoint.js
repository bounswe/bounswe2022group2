import { createLesson } from './createLesson.js';


export default async (req, res) => {
  try {
      const {resultMessage, lesson} = await createLesson(req.body.title, req.body.category);
      let status = 200;
      if(resultMessage == "Lesson could not be created.")
          status = 409;
      if(resultMessage == "Missing parameter")
          status = 400;
      return res.status(status).json({"resultMessage": resultMessage, "lesson": lesson});
  }catch(err) {
      let status = 500;
      return res.status(status).json({ "resultMessage": err.message });
  }
};
