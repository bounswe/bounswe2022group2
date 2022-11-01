import {Course} from '../models/index.js'
import launch_mongoose from '../loaders/mongoose.js'

await launch_mongoose();

let courses = [
  new Course({
    name: "Astronomical Photograpy",
    num_participants: 179
  }),
  new Course({
    name: "Public Aviation",
    num_participants: 106
  }), 
  new Course({
    name: "Arabic Music Theory",
    num_participants: 18
  }),
  new Course({
    name: "Jazz Fundamentals",
    num_participants: 57
  }),
  new Course({
    name: "Roman History",
    num_participants: 1956
  }),
  new Course({
    name: "Victorian Literature",
    num_participants: 197
  }),
  new Course({
    name: "Psychological Analysis",
    num_participants: 1
  }),
  new Course({
    name: "Piano Techniques",
    num_participants: 1
  })
]

courses.forEach(course => course.save().catch((err) => console.log("Could not save course to the DB: " + err.message)))