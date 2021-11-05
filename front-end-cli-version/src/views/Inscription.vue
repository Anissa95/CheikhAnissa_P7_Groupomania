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
      <div class="card-body">
        <h1 class="card-title">Connexion</h1>
        <div class="form-row">
          <label for="email">Email</label>
          <input
            type="email"
           class="form-row_input"
            id="email"
            required
            v-model="user.email"
            name="email"
          />
        </div>

        <div class="form-row">
          <label for="username">Username</label>
          <input
            type="username"
            class="form-row_input"
            id="username"
            required
            v-model="user.username"
            name="username"
          />
        </div>
        <div class="form-row">
          <label for="password">Password</label>
          <input
            type="password"
           class="form-row_input"
            id="password"
            required
            v-model="user.password"
            name="password"
          />
        </div>

        <button @click="saveUser" class="btn btn-success btn-props">
        S'inscrire
      </button>
        <div class="form-row">
        <p class="card-subtitle">Tu as déjà un compte</p>
         <router-link to="/" id="routerLink">Se connecter</router-link>
         </div>
      </div>
    </div>
    </div>
  </main>
</template>


<script>
import { signup } from "../services/user";
export default {
  name: "add-user",
  data() {
    return {
      user: {
        id: null,
        username: "",
        email: "",
        password: "",
        published: false,
      },
      submitted: false,
    };
  },
  methods: {
    saveUser() {
      const data = {
        username: this.user.username,
        email: this.user.email,
        password: this.user.password,
      };
      signup(data)
        .then(() => {
          this.$router.push("Actualite");
        })
        .catch((err) => console.log(err));
    },
    newUser() {
      this.submitted = false;
      this.user = {};
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