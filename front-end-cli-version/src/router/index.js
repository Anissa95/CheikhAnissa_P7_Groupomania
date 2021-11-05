import { createRouter, createWebHashHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Inscription from '../views/Inscription.vue'
import Actualite from '../views/Actualite.vue'

const routes = [{
        path: '/',
        name: 'Login',
        component: Login
    },
    {
        path: '/Inscription',
        name: 'Inscription',
        component: Inscription
    }, {
        path: '/Actualite',
        name: 'Actualite',
        component: Actualite
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router