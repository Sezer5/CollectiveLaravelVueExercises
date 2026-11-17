<template>
  <div>
    <Navbar />
    <Spinner :isLoading="authStore.isLoading" />
    <div class="col-md-12 mt-2 p-3">
      <div class="col-md-12 border border-2 p-3">
        <router-link class="btn btn-success btn-lg" to="/gallery/create"
          ><i class="bi bi-plus"></i> Add Gallery</router-link
        >
      </div>
      <div class="col-md-12 border border-2 p-3 mt-2">
        <div class="col-md-12">
          <h3>Galleries</h3>
          <hr />
        </div>
        <div class="col-md-12 mt-2 d-flex justify-content-between flex-wrap">
          <div
            class="card col-md-2 m-2"
            v-for="item in data.galleryItem"
            :key="item.id"
          >
            <div class="card-header d-flex justify-content-between">
              <h5>{{ item.name }}</h5>
              <button
                class="btn btn-danger btn-sm"
                @click="deleteItem(item.id)"
              >
                <i class="bi bi-x-lg"></i>
              </button>
            </div>
            <div class="card-body">
              <img :src="`${BASE_URL}/` + item.image" class="w-100" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore.js";
import Navbar from "../layouts/Navbar.vue";
import axios from "axios";
import { BASE_URL, headersConfig } from "@/helpers/config.js";
import { onMounted, reactive } from "vue";
import Spinner from "../layouts/Spinner.vue";
const authStore = useAuthStore();

const data = reactive({
  galleryItem: [],
});

const fetchGalleries = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.get(
      `${BASE_URL}/api/gallery`,
      headersConfig(authStore.access_token)
    );
    data.galleryItem = response.data.data;
  } catch (error) {
  } finally {
    authStore.isLoading = false;
  }
};

const deleteItem = async (gallery) => {
  authStore.isLoading = true;
  try {
    const response = await axios.delete(
      `${BASE_URL}/api/gallery/${gallery}/destroy`,
      headersConfig(authStore.access_token, "DELETE")
    );
    console.log(response.data.message);
    fetchGalleries();
  } catch (error) {
    console.log("Silme hatası:", error.response?.data || error);
  } finally {
    authStore.isLoading = false;
  }
};

onMounted(() => {
  fetchGalleries();
});
</script>

<style scoped>
</style>