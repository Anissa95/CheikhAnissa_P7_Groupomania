<template>
  <main>
    <div class="logo">
      <img
        alt="logo du réseau groupomania"
        src="../assets/icon-above-font.svg"
      />
    </div>
    <div class="container">
      <div class="card">
        <h1 class="card-title" v-if="mode == 'login'">Connexion</h1>
        <h1 class="card-title" v-else>Inscription</h1>
        <p class="card-subtitle" v-if="mode == 'login'">Tu n'as pas encore de compte ?
          <span class="card-action" @click="creationAccount()">Créer un compte</span>
        </p>
        <p class="card-subtitle" v-else>Tu as déjà un compte !
            <span class="card-action" @click="connectAccount()">Se connecter</span>
        </p>
        <div class="form-row" v-if="mode == 'create'"><input aria-label="Prénom" v-model="username" class="form-row_input" type="text" placeholder="Username"/>
        </div>
        <div class="form-row"> <input aria-label="adresse Email" v-model="email" class="form-row_input" type="text" placeholder="Adresse mail"/>
        </div>
        <div class="form-row"><input aria-label="mot de passe" v-model="password" class="form-row_input" type="password" placeholder="Mot de Passe" />
        </div>
        <div class="form-row"> <button @click="login()" class="btn btn-primary"  v-if="mode == 'login'">
            <span >Connexion</span>
          </button>
          <button @click="createAccount()" class="btn btn-success" v-else>
            <span >Créer mon compte</span>
          </button>
        </div>
      </div>
    </div>
  </main>
</template>
<script>

export default {
  name: "Login",
  data: function () {
    return {
      mode: "login",
      username: "",
      email: "",
      password: "",
    };
  },
  methods: {
    creationAccount: function () {
      this.mode = "create";
    },
    connectAccount: function () {
      this.mode = "login";
    },
    login: function () {
      
    },
    createAccount: function () {
      
    },
  },
};
</script>
<style lang="scss">
main {
  min-height: 500px;
  width: 100%;
}
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  margin-top: 30px;
}
.form-row {
  display: flex;
  margin: 16px 0px;
  gap: 16px;
  flex-wrap: wrap;
  justify-content: center;
}
.form-row_input {
  padding: 8px;
  border: none;
  border-radius: 8px;
  background: #f2f2f2;
  font-weight: 500;
  font-size: 16px;
  flex: 1;
  min-width: 100px;
  color: black;
  width: 100%;
}
.form-row_input::placeholder {
  color: #aaaaaa;
}
.logo {
  display: flex;
  justify-content: center;
  background: white;
}
.logo img {
  width: 200px;
  height: 100px;
  object-fit: cover;
}
.card {
  width: 400px;
  background: white;
  border-radius: 16px;
  padding: 16px;
  box-sizing: border-box;
  margin-top: 20px;
}
.card-title {
  text-align: center;
  font-weight: 800;
  color: rgb(245, 22, 22);
}
.card-subtitle {
  text-align: center;
  color: rgb(31, 29, 29);
  font-weight: 500;
}
.btn {
  color: white;
  border-radius: 8px;
  font-weight: 600;
  font-size: 18px;
  border: none;
  width: 100%;
  padding: 10px;
  transition: 0.4s background-color;
}
.card-action {
  color: #4043f3;
}
.card-action:hover {
  cursor: pointer;
}

</style>