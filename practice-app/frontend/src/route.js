import * as VueRouter from 'vue-router'

import a from './components/a.vue'
import b from './components/b.vue'
import Rating from './components/Rating.vue'
import Category from './components/Category.vue';

const routes = [
    { path: '/rating', component: Rating },
    { path: '/', component: a },
    { path: '/b', component: b },
    { path: '/category', component: Category }
];

const router = VueRouter.createRouter({
    // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
    history: VueRouter.createWebHashHistory(),
    routes, // short for `routes: routes`
});

export default router;