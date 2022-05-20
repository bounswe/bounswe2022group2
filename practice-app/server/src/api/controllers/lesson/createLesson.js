import Category from '../../../models/category.js';
import { Lesson } from '../../../models/index.js';
import { User } from '../../../models/index.js';

async function createLesson(name, category_name, user_id) {
  if(name===undefined || category_name===undefined || user_id ===undefined){
    return {
      resultMessage: "Missing parameter"
    }
  }
  const category = await Category.findOne({ title: category_name })
      .catch((err) => {
          return err;
      });

  const lecturer = await User.findOne({ _id: user_id})
      .catch((err) => {
          return err;
      });

  if (category && lecturer)
      {
        
          let lesson = new Lesson({
            name: name,
            category_id: category.id,
            lecturer: lecturer._id
          });
        
          lesson = await lesson.save().catch((err) => {
              return err;
          });
        
        
          return {
              resultMessage: "Lesson successfully created.", lesson: lesson.toJSON()
          };
      }
  else {
    throw new Error("Lesson could not be created.");
  }
  
}

export {createLesson}; 