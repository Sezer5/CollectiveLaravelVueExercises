<template>
  <div>
    <Navbar />
    <Spinner :isLoading="data.isLoading" />
    <div class="col-md-12 mt-2 p-3">
      <form @submit.prevent="addAlbum()" method="POST">
        <div class="col-md-5 d-flex">
          <div>
            <input
              type="text"
              class="form-control"
              name="name"
              v-model="data.imageName"
            />
          </div>
          <div>
            <input
              type="file"
              class="form-control"
              name="image"
              @change="handleImageChange"
              :key="data.imageKey"
            />
          </div>
          <div>
            <button class="btn btn-success btn-sm" type="submit">
              <i class="bi bi-plus"></i>Add
            </button>
          </div>
        </div>
      </form>
    </div>
    <div class="col-md-12 mt-2 p-3 d-flex justify-content-around flex-wrap">
      <div
        class="card mb-3"
        style="max-width: 320px"
        v-for="item in data.albumList"
        :key="item.id"
      >
        <img
          :src="`${BASE_URL}/` + item.image"
          class="card-img-top"
          alt="Product Image"
        />
        <div class="card-body d-flex justify-content-between">
          <h5 class="card-title">{{ item.name }}</h5>
          <button
            class="btn btn-outline-danger btn-sm"
            @click="deleteAlbum(item.id)"
          >
            <i class="bi bi-trash"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, reactive } from "vue";
import Navbar from "../layouts/Navbar.vue";
import axios from "axios";
import { BASE_URL, headersConfig } from "@/helpers/config.js";
import { useAuthStore } from "@/stores/useAuthStore.js";
import Spinner from "../layouts/Spinner.vue";

const authStore = useAuthStore();

const data = reactive({
  imageName: "",
  imageFile: null,
  imageKey: 0,
  isLoading: false,
  albumList: [],
});

const getAllAlbums = async () => {
  data.isLoading = true;
  try {
    const response = await axios.get(
      `${BASE_URL}/api/album`,
      headersConfig(authStore.access_token)
    );
    data.albumList = response.data.data;
  } catch (error) {
    console.log(error);
  } finally {
    data.isLoading = false;
  }
};

const handleImageChange = (event) => {
  data.imageFile = event.target.files[0];
};

const clearInput = () => {
  data.imageFile = null;
  data.imageName = "";
  data.imageKey += 1;
};

const addAlbum = async () => {
  data.isLoading = true;
  try {
    const formData = new FormData();
    formData.append("image", data.imageFile);
    formData.append("name", data.imageName);
    formData.append("_method", "POST");
    const response = await axios.post(
      `${BASE_URL}/api/album/store`,
      formData,
      headersConfig(authStore.access_token, "multipart/from-data")
    );
    clearInput();
    getAllAlbums();
  } catch (error) {
  } finally {
    data.isLoading = false;
  }
};

const deleteAlbum = async (album) => {
  data.isLoading = true;
  try {
    const response = await axios.delete(
      `${BASE_URL}/api/album/${album}/destroy`,
      headersConfig(authStore.access_token, "DELETE")
    );
    getAllAlbums();
  } catch (error) {
  } finally {
    data.isLoading = false;
  }
};

onMounted(() => {
  getAllAlbums();
});
</script>

<style scoped>
</style>