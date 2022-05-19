import * as VueRouter from 'vue-router';
import Category from './components/Category.vue';
import Login from './components/Login.vue';
import Signup from './components/Signup.vue';

const routes = [
    { path: '/', component: Signup, name: "Signup" },
    { path: '/category', component: Category, name: "Categories" },
    { path: '/login', component: Login, name: "Login" }
];

const router = VueRouter.createRouter({
    history: VueRouter.createWebHistory(),
    mode: 'history',
    routes, // short for `routes: routes`
});

export default router;