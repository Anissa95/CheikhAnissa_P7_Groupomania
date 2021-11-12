<template>
  <div class="container">
    <!-- Nouveau post -->
    <form id="formPost" class="card-post">
      <div class="header-box">
        <h1 class="card-title">Modifier le post</h1>
      </div>
      <div v-if="image != ''" class="image-block">
        <img :src="image" />
      </div>
      <div class="title-desc">
        <div class="mb-3">
          <label for="title" class="form-label">Titre</label>
          <input
            v-model="title"
            class="form-control"
            name="title"
            id="title"
            type="text"
          />
        </div>
        <div class="mb-3">
          <label for="description" class="form-label">Description</label>
          <input
            v-model="description"
            class="form-control"
            name="description"
            id="description"
            type="text"
          />
        </div>
      </div>
      <div class="form-row">
        <input
          name="image"
          type="file"
          id="input-image"
          @change="updatePicture"
          accept="image/png, image/jpg, image/jpeg, image/gif"
        />
        <input
          class="validPost"
          type="button"
          value="Choisir une image"
          onclick="document.getElementById('input-image').click();"
        />
      </div>
      <div class="form-row">
        <button @click="submitData" type="button" class="validPost">
          Valider
        </button>
      </div>
    </form>
  </div>
</template>
<script>
import { getOnePost, updatePost } from "../services/post";
export default {
  name: "EditPost",
  data() {
    return {
      image: "",
      title: "",
      description: "",
    };
  },
  mounted() {
    getOnePost(this.$route.params.id).then((response) => {
      this.image = response.data.post.imageUrl;
      this.title = response.data.post.title;
      this.description = response.data.post.description;
    });
  },
  methods: {
    //Générer l'image choisi par l'utilisateur
    createImage(file) {
      const reader = new FileReader();
      const vm = this;
      reader.onload = (e) => {
        vm.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    updatePicture(e) {
      const file = e.target.files || e.dataTransfer.files;
      if (!file.length) {
        return;
      }
      this.image = file[0];
      this.createImage(file[0]);
    },
    /* Envoie des données */
    submitData() {
      let formData = {};
      formData = new FormData(document.getElementById("formPost"));
      updatePost(this.$route.params.id, formData)
        .then(() => {
          this.$router.push("/Actualite");
        })
        .catch((err) => {
          console.log("Erreur: " + err);
        });
    },
  },
};
</script>
<style lang="scss" >
</style>
