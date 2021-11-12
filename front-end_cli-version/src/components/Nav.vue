<template>
  <div>
    <nav class="navbar">
      <div class="container-fluid position">
        <a class="navbar-brand" @click="goToWall" title="Actualite">
          <div class="logo">
            <img
              alt="logo du réseau groupomania"
              src="../assets/icon-left-font-monochrome-white.png"
            />
          </div>
        </a>
        <ul>
          <li>
            <a
              v-if="isLogged === true"
              @click="goToProfilPage"
              title="Profile"
              class="fas fa-user-circle"
            ></a>
          </li>
          <li>
            <a
              v-if="isAdmin === true && isLogged === true"
              @click="goToAdminsPage"
              title="Administrateur"
              class="fas fa-user-cog"
            ></a>
          </li>
          <li>
            <a
              v-if="isLogged === true"
              @click="signout"
              title="Se déconnecter"
              class="fas fa-sign-in-alt"
            ></a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>
<script>
export default {
  name: "Nav",
  computed: {
    isAdmin() {
      return this.$store.state.user.isAdmin;
    },
    isLogged() {
      return this.$store.state.user.isLogged;
    },
  },
  methods: {
    goToAdminsPage() {
      this.$router.push("/admin");
    },
    signout() {
      localStorage.removeItem("token");
      this.$store.dispatch("signout").then(() => this.$router.push("/"));
    },
    goToProfilPage() {
      this.$router.push("Profile");
    },
    goToWall() {
      this.$router.push("actualite");
    },
  },
};
</script>
<style lang="scss">
.position {
  position: sticky;
  top: 0;
}
.logo img {
  width: 200px;
  height: 100px;
  object-fit: cover;
}
.logo {
  display: flex;
  justify-content: center;
}
.navbar {
  position: relative;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  background:rgb(50, 50, 105);
  padding: 0;
}
ul {
  display: flex;
  list-style: none;
  padding: 0;
  width: 250px;
  justify-content: space-between;
}
a {
  font-size: 2.5rem;
  padding: 2px 10px;
  cursor: pointer;
  text-decoration: none;
  color: black;
}
.fas{
  color:white;
}
a:hover {
  color: rgb(223, 139, 139);
}
@media screen and (max-width: 600px) {
.logo img {
    height: 50px;
  }
  .container-fluid.position{
  display: flex;
  justify-content: space-around;
}
a{
font-size: 2rem;
}
}
</style>