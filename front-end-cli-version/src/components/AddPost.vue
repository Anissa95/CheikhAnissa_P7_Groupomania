<template>
  <div class="main">
    <!-- for new post -->
    <div class="container">
      <form id="formPost" class="card">
        <div class="header-box">
          <h1>Nouveau Post</h1>
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
            placeholder="Taper votre message"
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

export default {
  name: "AjoutPost",
 
  data() {
    return {
      image: "",
      title: "",
      description: "",
      comment: "",
    };
  },
}
</script>

<style lang="scss">
.validPost {
  margin-left: 10px;
}
#input-image {
  display: none;
}
img {
  width: 300px;
  height: auto;
}
</style>