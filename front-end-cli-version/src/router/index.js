import { createRouter, createWebHashHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Inscription from '../views/Inscription.vue'
import Actualite from '../views/Actualite.vue'
import AddPost from "../components/AddPost.vue";
import EditPost from "../components/EditPost.vue";
import Profile from "../views/Profile.vue";

// pour garder la session ouverte de l'utilisateur, on crée authenticate pour verifier la présence ou pas du token dans localstorage
const authenticate = (to, from, next) => {


    if (localStorage.getItem("token")) {
        next();
    } else next("/login");
};

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
        component: Actualite,
        beforeEnter: authenticate,
    },
    {
        path: "/addPost",
        name: "AddPost",
        component: AddPost,
        beforeEnter: authenticate,
    },
    {
        path: "/post/:id",
        name: "EditPost",
        component: EditPost,
        beforeEnter: authenticate,
    },
    {
        path: "/profile",
        name: "Profile",
        component: Profile,
        beforeEnter: authenticate,
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router