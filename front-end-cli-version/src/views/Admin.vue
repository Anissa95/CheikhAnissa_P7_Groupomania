<template>
  <div class="container">
    <h1>Liste des administrateurs</h1>
    <ul class="list-group list">
      <li v-for="admin in admins" v-bind:key="admin.id" class="list-group-item">
        {{ admin.username }}
      </li>
    </ul>
  </div>
</template>
<script>
import { getAdmin } from "../services/user";
export default {
  name: "admins",
  data() {
    return {
      admins: [],
    };
  },
  mounted() {
    getAdmin().then((response) => {
      this.admins = response.data.users;
    });
  },
};
</script>