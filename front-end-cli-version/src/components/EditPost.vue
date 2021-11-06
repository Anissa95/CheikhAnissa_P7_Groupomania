<template>
  <div>
    <!-- for new post -->
    <form id="formPost">
      <div class="header-box">
        <h2>Edit Post</h2>
      </div>
      <div v-if="image != ''" class="image-block">
        <img :src="image" />
      </div>

      <div class="mb-3">
        <label for="title" class="form-label">Title</label>
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
      <div>
        <input
          name="image"
          type="file"
          id="input-image"
          @change="updatePicture"
          accept="image/png, image/jpg, image/jpeg, image/gif"
        />
        <input
          type="button"
          value="Choisir une image*"
          onclick="document.getElementById('input-image').click();"
        />
        <button @click="submitData" type="button">
          Valider
        </button>
      </div>
    </form>
  </div>
</template>

<script>

export default {
  name: "EditPost",
  data() {
    return {
      image: "",
      title: "",
      description: "",
    };
  },
 
};
</script>

