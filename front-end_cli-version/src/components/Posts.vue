<template>
  <div class="container-fluid">
    <h1 class="card-actualite">Actualités</h1>
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
    <div v-for="post in posts" :key="post.id" class="container">
      <div>
        <div class="card-post">
          <div>
            <h2 class="card-title">{{ post.title }}</h2>
            <div class="card-info">
              <h3>
                Publié par :{{ post.username }} le
                {{ dateOfPost(post.createdAt) }}
              </h3>
            </div>
            <img :src="post.imageUrl" class="card-img-top" :alt="post.title" />
            <p class="card-description">
              Description:
              {{ post.description }}
            </p>
          </div>
          <div v-for="comment in comments" :key="comment.id">
            <div v-if="comment.postId === post.id">
              <div class="edit-comment mb-3 style-div">
                <div class="commented" v-bind:id="`comment-${comment.id}`">
                  <div class="card-info">
                    <h3>
                      Commenté par: {{ comment.author }}<br />
                      Le {{ dateOfComment(comment.createdAt) }}
                    </h3>
                  </div>
                  <div>
                    Commentaire: {{ comment.comment }}
                    <hr />
                  </div>
                </div>
                <div class="input-group">
                  <input
                    v-bind:id="`comment-${comment.id}-edit`"
                    type="text"
                    class="form-row"
                    name="commentaire"
                    aria-label="Ecrivez un commentaire"
                    placeholder="Ecrivez un commentaire"
                    style="display: none"
                  />
                  <br />
                  <button
                    v-bind:id="`comment-${comment.id}-edit-button`"
                    class="btn btn-secondary"
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
                      v-if="userId == comment.authorId"
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
          <br />
          <div class="input-group mb-3">
            <input
              v-bind:id="`post-${post.id}-input`"
              type="text"
              class="form-control"
              name="commentaire"
              aria-label="Ecrivez un commentaire"
              placeholder="Ecrivez un commentaire"
            />
            <br />
            <button
              class="btn btn-connex"
              type="button"
              id="button-addon2"
              @click="addComment(post.id)"
            >
              Envoyer
            </button>
          </div>
          <div class="btn-edit-delete-post">
            <a
              class="btn btn-connex"
              v-if="userId == post.userId"
              @click="goToEditPage(post.id)"
              >Modifier</a
            >
            <a
              class="btn btn-connex"
              v-if="userId == post.userId || isAdmin === true"
              @click="deletePost(post.id)"
              >Supprimer</a
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { getAllPost, deletePost } from "../services/post";
import { addComment, deleteComment, updateComment } from "../services/comment";
export default {
  name: "Posts",
  data() {
    return {
      posts: [],
      comments: [],
    };
  },
  computed: {
    isAdmin() {
      return this.$store.state.user.isAdmin;
    },
    isLogged() {
      return this.$store.state.user.isLogged;
    },
    userId() {
      return this.$store.state.user.userId;
    },
  },
  // Après que le composant soit chargé, on exécute tout ce qui est à l'intérieur de la fct mounted
  mounted() {
    getAllPost().then((response) => {
      this.posts = response.data.result.posts;
      this.comments = response.data.result.comments;
    });
  },
  methods: {
    dateOfPost(date) {
      const event = new Date(date);
      const opt = {
        year: "numeric",
        month: "long",
        day: "numeric",
        hour: "numeric",
        minute: "numeric",
      };
      return event.toLocaleDateString("fr-Fr", opt);
    },
    dateOfComment(date) {
      const event = new Date(date);
      const opt = {
        year: "numeric",
        month: "long",
        day: "numeric",
        hour: "numeric",
        minute: "numeric",
      };
      return event.toLocaleDateString("fr-Fr", opt);
    },
    goToEditPage(id) {
      this.$router.push({ name: "EditPost", params: { id } });
    },
    deletePost(id) {
      deletePost(id).then(() => {
        getAllPost().then((response) => {
          this.posts = response.data.result.posts;
          this.comments = response.data.result.comments;
        });
      });
    },
    addComment(id) {
      const inputId = `post-${id}-input`;
      const comment = document.getElementById(inputId).value;
      addComment(id, { comment }).then(() => {
        getAllPost().then((response) => {
          this.posts = response.data.result.posts;
          this.comments = response.data.result.comments;
          document.getElementById(inputId).value = "";
        });
      });
    },
    deleteComment(id) {
      deleteComment(id).then(() => {
        getAllPost().then((response) => {
          this.posts = response.data.result.posts;
          this.comments = response.data.result.comments;
        });
      });
    },
    goToAddPage() {
      this.$router.push("AddPost");
    },
    showEdit(id, comment) {
      document.getElementById(`comment-${id}`).style.display = "none";
      document.getElementById(`comment-${id}-edit`).style.display = "flex";
      document.getElementById(`comment-${id}-edit`).value = comment;
      document.getElementById(`comment-${id}-edit-button`).style.display =
        "block";
    },
    editComment(id) {
      const inputId = `comment-${id}-edit`;
      const comment = document.getElementById(inputId).value;
      updateComment(id, { comment }).then(() => {
        document.getElementById(`comment-${id}`).style.display = "flex";
        document.getElementById(`comment-${id}-edit`).style.display = "none";
        document.getElementById(`comment-${id}-edit-button`).style.display =
          "none";
        getAllPost().then((response) => {
          this.posts = response.data.result.posts;
          this.comments = response.data.result.comments;
        });
      });
    },
  },
};
</script>
<style lang="scss">
.container-fluid {
  margin-top: 20px;
}
.commented {
  display: flex;
  flex-direction: column;
  width: 100%;
  text-align: left;
}
.card-actualite {
  color: rgb(12, 12, 82);
  font-size: 34px;
  font-weight: 800;
}
.card-description {
  display: flex;
  flex-wrap: wrap;
  font-size: 18px;
  color: black;
}
.card-info h3 {
  font-size: 14px;
  color: black;
  display: flex;
}
.style-div {
  display: flex;
  align-items: center;
  gap: 12px;
}
.far.fa-edit.post {
  border-radius: 8px;
  font-weight: 600;
  font-size: 20px;
  border: none;
  padding: 10px;
}
.style-icon {
  cursor: pointer;
}
.form-control {
  margin-bottom: 10px;
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
@media screen and (max-width: 800px) {
  .card-post {
    max-width: 300px;
  }
}
</style>