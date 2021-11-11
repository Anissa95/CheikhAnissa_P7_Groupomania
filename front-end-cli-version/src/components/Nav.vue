<template>
  <div>
    <nav class="navbar">
      <div class="container-fluid position">
        <a class="navbar-brand" @click="goToWall" title="Actualite">
          <div class="logo">
            <img
              alt="logo du réseau groupomania"
              src="../assets/icon-above-font.svg"
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
.navbar {
  position: relative;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  background: white;
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
a:hover {
  color: grey;
}
</style>