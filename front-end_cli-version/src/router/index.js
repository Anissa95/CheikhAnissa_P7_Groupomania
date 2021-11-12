import { createRouter, createWebHashHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Inscription from '../views/Inscription.vue'
import Actualite from '../views/Actualite.vue'
import AddPost from "../components/AddPost.vue";
import EditPost from "../components/EditPost.vue";
import Profile from "../views/Profile.vue";
import Admins from "../views/Admin.vue";
import store from "../store";

// Afin de garder la session ouverte de l'utilisateur, on crée authenticate pour verifier la présence ou pas du token dans localstorage
const authenticate = (to, from, next) => {
    store.state.user.isLogged = true;
    // Fonction pour se déconnecter
    function logout() {
        if (localStorage.getItem("token")) {
            localStorage.removeItem("token");
        }
        store.state.user.isLogged = false;
        next("/");
    }
    //  Si  y a pas de token on se déconnecte
    if (!localStorage.getItem("token")) {
        logout();
        return;
    }
    //  si token on se redirige vers mur d'actualité
    if (localStorage.getItem("token")) {
        next();
    } else next("/");
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
        path: "/post:id",
        name: "EditPost",
        component: EditPost,
        beforeEnter: authenticate,
    },
    {
        path: "/profile",
        name: "Profile",
        component: Profile,
        beforeEnter: authenticate,
    }, {
        path: "/admin",
        name: "Admin",
        component: Admins,
        beforeEnter: authenticate,
    },
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router