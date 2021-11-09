<template>
  <div class="main">
    <!-- for new post -->
    <div class="container">
      <form id="formPost" class="card-post">
        <div class="header-box">
          <h1 class="card-title">Nouveau Post</h1>
        </div>
        <div v-if="image != ''" class="image-block">
          <img :src="image" />
        </div>

        <div class="form-row">
          <input
            v-model="title"
            class="form-control"
            name="title"
            id="title"
            type="text"
            placeholder="Titre"
          />
        </div>
        <div class="form-row">
          <textarea
            v-model="description"
            class="form-control"
            placeholder="Entrez votre message"
            id="description"
            type="text"
          ></textarea>
        </div>
        <div class="form-row">
          <input
            name="image"
            type="file"
            id="input-image"
            @change="updatePicture"
            accept="image/png, image/jpg, image/jpeg, image/gif"
          />
        </div>
        <div class="form-row">
          <input
            class="validPost"
            type="button"
            value="Choisir une image"
            onclick="document.getElementById('input-image').click();"
          />
          <button @click="submitData" type="button" class="validPost">
            Valider
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import { createPost } from "../services/post";
export default {
  name: "addPost",
 
  data() {
    return {
      image: "",
      title: "",
      description: "",
      comment: "",
    };
  },
  methods: {
    //pour générer l'image sélectionnée par l'utilisateur
    createImage(file) {
      const reader = new FileReader();
      const vm = this;
      reader.onload = (e) => {
        vm.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    // téléchargement de l'image
    updatePicture(e) {
      const file = e.target.files || e.dataTransfer.files;
      if (!file.length) {
        return;
      }
      this.image = file[0];
      this.createImage(file[0]);
    },
    /* Envoie des données*/
    submitData() {
      if (this.submitDisabled) {
        return;
      }
      let formData = {};
      formData = new FormData(document.getElementById("formPost"));
      // création d'un nouveau post
      createPost(formData)
        .then(() => {
          // pour diriger vers la page home
          this.$router.push("Actualite");
        })
        .catch((err) => {
          console.log("Erreur: " + err);
        });
    },
  },
}
</script>

<style lang="scss">
.validPost {
  margin-left: 10px;
   border-radius: 8px;
  font-weight: 600;
  font-size: 18px;
  border: none;
  width: 100%;
  padding: 10px;

}
.card-post{
  width: 600px;
  background: white;
  border-radius: 16px;
  padding: 16px;
  box-sizing: border-box;
  margin-top: 20px;
}
#input-image {
  display: none;
}
img {
  width: 300px;
  height: auto;
}
</style>