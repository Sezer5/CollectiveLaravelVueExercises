<template>
  <div class="col-md-3 border border-3 p-3 vh-75">
    <Spinner :isLoading="authStore.isLoading" />
    <div>
      <div class="d-flex justify-content-center align-items-center flex-column">
        <div>
          <img
            :src="
              authStore.user?.profile_image
                ? `${BASE_URL}/${authStore.user?.profile_image}`
                : 'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png'
            "
            width="120"
            class="border border-2 rounded-circle"
          />
        </div>
        <div class="mt-3">
          <form @submit.prevent="updateProfileImage()" method="POST">
            <div class="mb-3 d-flex justify-content-between">
              <input
                type="file"
                class="form-control"
                name="profile_image"
                id="profile_image"
                placeholder="profile_image"
                aria-describedby="fileHelpId"
                @change="handleImageChange"
                :key="data.imageKey"
              />
              <button class="btn btn-dark"><i class="bi bi-upload"></i></button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { useAuthStore } from "@/stores/useAuthStore.js";
import Spinner from "../layouts/Spinner.vue";
import { BASE_URL, headersConfig } from "@/helpers/config.js";
import { reactive } from "vue";
import axios from "axios";

const authStore = useAuthStore();

const data = reactive({
  profileImage: null,
  imageKey: 0,
});

const handleImageChange = (event) => {
  data.profileImage = event.target.files[0];
};

const clearInput = () => {
  data.profileImage = null;
  data.imageKey += 1;
};

const updateProfileImage = async () => {
  authStore.isLoading = true;
  try {
    const formData = new FormData();
    formData.append("profile_image", data.profileImage);
    formData.append("_method", "PUT");

    const response = await axios.post(
      `${BASE_URL}/api/user/update`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
    );
    authStore.setUser(response.data.user);
    clearInput();
  } catch (error) {
    console.log(error);
  } finally {
    authStore.isLoading = false;
  }
};
</script>
<style scoped>
.vh-75 {
  height: 75vh;
}
</style>