<template>
  <div class="container">
    <div class="card">
      <h1>Profil</h1>
      <div>
        <ul class="list-group ">
          <li class="list-group-item margin">
            Nom d'utilisateur: {{ user.username }}
          </li>
          <li class="list-group-item margin ">Email: {{ user.email }}</li>
        </ul>
        <div class="input-group mb-3">
          <label for="password">Mot de passe:</label>
          <input
            v-model="password"
            type="password"
            class="form-control"
            id="password"
            name="password"
            placeholder="Ecrivez votre mot de passe"
          /></div>
          <div class="form-row"> 
          <button class="btn btn-danger" @click="deleteAccount">
            Supprimer compte
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>

export default {
  name: "profil",
  data() {
    return {
      user: {},
      password: "",
    };
  },
}
</script>
<style lang="scss">

.margin {
  margin-bottom: 20px;
}
</style>