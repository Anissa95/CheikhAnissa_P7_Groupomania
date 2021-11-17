<template>
  <div class="container">
    <div class="card">
      <h1 class="card-title">Profil</h1>
      <div>
        <ul class="list-group ">
          <li class="list-group-item margin">
            Nom d'utilisateur: {{ user.username }}
          </li>
         <!-- <li class="list-group-item margin ">Email: {{ user.email }}</li>-->
        </ul>
        <div class="input-group mb-3">
          <label for="password">Mot de passe:</label>
          <input
            v-model="password"
            type="password"
            class="form-control"
            id="password"
            name="password"
            placeholder="Entrez votre mot de passe"
          /></div>
          <div class="form-row"> 
          <button class="btn btn-connex" @click="deleteAccount">
            Supprimer compte
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { deleteUser, getUser } from "../services/user";
export default {
  name: "profile",
  data() {
    return {
      user: {},
      password: "",
    };
  },
  mounted() {
    getUser().then((response) => {
      this.user = response.data.user;
    });
  },
  methods: {
    deleteAccount() {
      deleteUser(this.password)
        .then(() => {
          // on supprime le token du user du loalstorage
          localStorage.removeItem("token");
          // on solicite la méhode signout du store
          this.$store.dispatch("signout").then(() => {
            // on redirige le user vers la vue Login et un message apparait
            this.$router.push("/");
            alert("Votre compte est bien supprimé");
          });
        })
        .catch((err) => console.log(err));
    },
  },
};
</script>
<style lang="scss">
.margin {
  margin-bottom: 20px;
}
</style>