<template>
  <div class="container">
    <div class="button">
      <button
        type="button"
        title="Ecrire un post"
        class="far fa-edit post"
        @click="goToAddPage"
      >
        Ajouter post
      </button>
    </div>
    <div v-for="post in posts" :key="post.id" class="row">
      <div>
        <div class="card card-style">
          <img :src="post.imgURL" class="card-img-top" :alt="post.title" />
          <div class="card-body">
            <h5 class="card-title">{{ post.title }}</h5>
            <p class="card-text">
              {{ post.description }}
            </p>
            <div v-for="comment in comments" :key="comment.id">
              <div v-if="comment.postId === post.id">
                <div class="edit-comment mb-3 style-div">
                  <div
                    v-bind:id="`comment-${comment.id}`"
                    style="display: flex"
                  >
                    <div style="margin-right: 6px">{{ comment.author }}:</div>
                    <div>{{ comment.comment }}</div>
                  </div>
                  <div class="input-group">
                    <input
                      v-bind:id="`comment-${comment.id}-edit`"
                      type="text"
                      class="form-control"
                      name="commentaire"
                      placeholder="Ecrivez un commentaire"
                      style="display: none"
                    />
                    <button
                      v-bind:id="`comment-${comment.id}-edit-button`"
                      class="btn btn-outline-secondary"
                      type="button"
                      @click="editComment(comment.id)"
                      style="display: none"
                    >
                      Envoyer
                    </button>
                  </div>
                  <div class="edit-delete-icon">
                    <span @click="showEdit(comment.id, comment.comment)">
                      <i
                        v-if="userId == comment.authorId || isAdmin === true"
                        class="fas fa-edit style-icon"
                      ></i>
                    </span>
                    <span @click="deleteComment(comment.id)">
                      <i
                        v-if="userId == comment.authorId || isAdmin === true"
                        class="fas fa-trash-alt style-icon"
                      ></i
                    ></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input
                v-bind:id="`post-${post.id}-input`"
                type="text"
                class="form-control"
                name="commentaire"
                placeholder="Ecrivez un commentaire"
              />
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
                @click="addComment(post.id)"
              >
                Envoyer
              </button>
            </div>
            <div class="btn-edit-delete-post">
              <a
                class="btn btn-warning"
                v-if="userId == post.userId || isAdmin === true"
                @click="goToEditPage(post.id)"
                >Modifier</a
              >
              <a
                class="btn btn-danger"
                v-if="userId == post.userId || isAdmin === true"
                @click="deletePost(post.id)"
                >Supprimer</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "Posts",
  data() {
    return {
      posts: [],
      comments: [],
    };
  },
  methods: {
    goToAddPage() {
      this.$router.push("AddPost");
    },
  },
};
</script>
<style lang="scss">
.style-div {
  display: flex;
  align-items: center;
  gap: 12px;
}
.card-style {
  margin-bottom: 20px;
}
.far.fa-edit.post{
   border-radius: 8px;
  font-weight: 600;
  font-size: 18px;
  border: none;
  width: 100%;
  padding: 10px;
}
.style-icon {
  cursor: pointer;
}
.btn-edit-delete-post {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
}
.icon-color {
  color: black;
}
.edit-comment {
  display: flex;
  justify-content: space-between;
}
.edit-delete-icon {
  display: flex;
  gap: 12px;
}
</style>