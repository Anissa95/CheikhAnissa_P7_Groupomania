<template>
  <div class="container-fluid">
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
        <div class="card-post ">
          <h5 >{{ post.title }}</h5>
          <img :src="post.imageUrl" class="card-img-top" :alt="post.title" />
          
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
                    <div>Commenté par: {{ comment.author }} </div>
                   <div>Le {{ dateOfPost(post.createdAt) }}</div>
                    <div>Commentaire: {{ comment.comment }}</div>
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
</template>
<script>
import { getAllPost,deletePost } from "../services/post";
import { addComment,deleteComment,updateComment } from "../services/comment";
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
  // après que le composant soit chargé, on exécute tout ce qui est à l'intérieur de la fct mounted
  mounted() {
    getAllPost().then((response) => {
      this.posts = response.data.result.posts;
      this.comments = response.data.result.comments;
    });
  },
  methods: {
    dateOfPost(date){
            const event = new Date(date);
            const opt = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' };

            return event.toLocaleDateString('fr-Fr', opt);
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
.container-fluid{
  margin-top: 20px;
}
#comment-1{
  display: flex;
    flex-direction: column;
    width: 100%;
    align-items: flex-start;
}

.style-div {
  display: flex;
  align-items: center;
  gap: 12px;
}
.far.fa-edit.post{
   border-radius: 8px;
  font-weight: 600;
  font-size: 18px;
  border: none;
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