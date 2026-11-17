<template>
  <div>
    <Navbar />
    <div class="col-md-12">
      <Spinner :isLoading="authStore.isLoading" />
      <div class="card col-md-4 mt-2 p-3 m-3">
        <div class="card-header">
          <h3>Gallery Create</h3>
        </div>
        <div class="card-body">
          <form @submit.prevent="addGalleryItem" method="post">
            <div class="mb-3">
              <label for="" class="form-label">Name</label>
              <input
                type="text"
                class="form-control"
                name="name"
                id="name"
                aria-describedby="helpId"
                placeholder="Please enter a name*"
                v-model="data.name"
              />
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Image</label>
              <input
                type="file"
                class="form-control"
                name="image"
                id="image"
                aria-describedby="helpId"
                placeholder="Please enter a image*"
                @change="handleImageChange"
                :key="data.key"
              />
            </div>
            <div class="mb-3 text-end">
              <button class="btn btn-success btn-sm" type="submit">
                <i class="bi bi-plus"></i> Add
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from "vue";
import Navbar from "../layouts/Navbar.vue";
import { useAuthStore } from "@/stores/useAuthStore.js";
import { useToast } from "vue-toastification";
import { useRouter } from "vue-router";
import axios from "axios";
import { BASE_URL, headersConfig } from "@/helpers/config.js";
import Spinner from "../layouts/Spinner.vue";

const data = reactive({
  file: null,
  key: 0,
  name: "",
});

const authStore = useAuthStore();
const toast = useToast();
const router = useRouter();

const handleImageChange = (event) => {
  data.file = event.target.files[0];
};

const clearInput = () => {
  data.key += 1;
  data.name = "";
  data.file = null;
};

const addGalleryItem = async () => {
  authStore.isLoading = true;

  const formData = new FormData();

  formData.append("image", data.file);
  formData.append("name", data.name);
  formData.append("_method", "POST");

  try {
    const response = await axios.post(
      `${BASE_URL}/api/gallery/store`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
    );
    authStore.setUser(response.data.user);
    clearInput();
    router.push("/gallery");
  } catch (error) {
    console.log(error);
  } finally {
    authStore.isLoading = false;
  }
};
</script>

<style scoped>
</style>