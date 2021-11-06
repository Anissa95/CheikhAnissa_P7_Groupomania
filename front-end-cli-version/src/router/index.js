import { createRouter, createWebHashHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Inscription from '../views/Inscription.vue'
import Actualite from '../views/Actualite.vue'
import AddPost from "../components/AddPost.vue";
import EditPost from "../components/EditPost.vue";
import Profile from "../views/Profile.vue";
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
    },
    {
        path: "/addPost",
        name: "AddPost",
        component: AddPost,
    },
    {
        path: "/post/:id",
        name: "EditPost",
        component: EditPost
    },
    {
        path: "/profile",
        name: "Profile",
        component: Profile
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router