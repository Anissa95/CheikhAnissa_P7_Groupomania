<template>
<div class="container">
  <div class="card-user">
<div>
    <h1 class="card-title">Les administrateurs</h1>
    <ul class="list-group list">
      <li v-for="admin in admins" v-bind:key="admin.id" class="list-group-item">
      Nom:{{ admin.username }}
      </li>
    </ul></div>
  </div></div>
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
<style lang="scss">
.card-user{
  max-width: 700px;
  background: white;
  border-radius: 16px;
  padding: 16px;
  box-sizing: border-box;
  margin-top: 20px;
}
.list-group {
  width: 100%;
  text-align: left;
}
</style>