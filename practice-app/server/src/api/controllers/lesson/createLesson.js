import Category from '../../../models/category.js';
import { Lesson } from '../../../models/index.js';


async function createLesson(name, category_name) {
  if(name===undefined || category_name===undefined){
    return {
      resultMessage: "Missing parameter"
    }
  }
  const category = await Category.findOne({ title: category_name })
      .catch((err) => {
          return err;
      });

  if (category)
      {
        
          let lesson = new Lesson({
            name: name,
            category_id: category.id
          });
        
          lesson = await lesson.save().catch((err) => {
              return err;
          });
        
        
          return {
              resultMessage: "Lesson successfully created.", lesson: lesson.toJSON()
          };
      }
  else {
    throw new Error("Category does not exist.");
  }
  
}

export {createLesson}; 