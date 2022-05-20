import * as VueRouter from 'vue-router';
import Category from './components/Category.vue';
import CategoryLessons from './components/CategoryLessons.vue';
import Login from './components/Login.vue';
import Rating from './components/Rating.vue';
import Signup from './components/Signup.vue';
import Event from './components/Event.vue';
import Attend from './components/Attend.vue';
import AttendedEvents from './components/AttendedEvents.vue';
import EnrolledLessons from "./components/EnrolledLessons.vue";
import SearchLesson from './components/SearchLesson.vue';
import LessonEvents from './components/LessonEvents.vue';


const routes = [
    { path: '/', component: Signup, name: "Signup", props: true, },
    { path: '/category', component: Category, name: "Categories", props: true, },
    { path: '/categoryLessons', component: CategoryLessons, name: "CategoryLessons", props: true, },
    { path: '/login', component: Login, name: "Login" },
    { path: '/rating', component: Rating },
    { path: '/create-event', component: Event, name: "CreateEvent" },
    { path: '/attend', component: Attend, name: "Attend" },
    { path: '/attended-events', component: AttendedEvents, name: "AttendedEvents" },
    { path: '/enrolled-lessons', component: EnrolledLessons, name: "EnrolledLessons"},
    { path: '/search-lesson', component: SearchLesson, name: "SearchLesson"},
    { path: '/lesson-events', component: LessonEvents, name: "LessonEvents"},
];

const router = VueRouter.createRouter({
    history: VueRouter.createWebHashHistory(),
    mode: 'history',
    routes, // short for `routes: routes`
});

export default router;
