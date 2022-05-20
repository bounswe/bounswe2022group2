import * as VueRouter from 'vue-router';
import Category from './components/Category.vue';
import CategoryLessons from './components/CategoryLessons.vue';
import Login from './components/Login.vue';
import Rating from './components/Rating.vue';
import Signup from './components/Signup.vue';


const routes = [
    { path: '/', component: Signup, name: "Signup", props: true, },
    { path: '/category', component: Category, name: "Categories", props: true, },
    {
        path: '/categoryLessons', component: CategoryLessons, name: "CategoryLessons", props: true,
    },
    { path: '/login', component: Login, name: "Login" },
    { path: '/rating', component: Rating },
];

const router = VueRouter.createRouter({
    history: VueRouter.createWebHistory(),
    mode: 'history',
    routes, // short for `routes: routes`
});

export default router;