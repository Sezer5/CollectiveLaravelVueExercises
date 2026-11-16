<template>
  <div
    class="d-flex flex-column flex-shrink-0 p-3 text-white bg-light vh-100 rounded"
    style="width: 280px"
  >
    <Spinner :isLoading="authStore.isLoading" />
    <a
      href="/"
      class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none"
    >
      <span class="fs-4 text-black">Profile</span>
    </a>
    <hr class="text-black" />
    <div>
      <div class="text-center">
        <img
          src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
          width="160"
          class="rounded-circle"
          v-if="!authStore.user?.profile_image"
        />
        <img
          :src="`${BASE_URL}/` + authStore.user?.profile_image"
          width="160"
          class="rounded-circle"
          v-else
        />
      </div>
      <div class="d-flex mt-5">
        <input
          type="file"
          class="form-control"
          :key="data.profileImageKey"
          @change="handleImageChange"
        />
        <button class="btn btn-dark">
          <i class="bi bi-upload" @click="changeProfileImage()"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import { reactive } from "vue";
import { useToast } from "vue-toastification";
import Spinner from "../layouts/Spinner.vue";
import axios from "axios";

const authStore = useAuthStore();
const toast = useToast();

const handleImageChange = (event) => {
  data.profileImage = event.target.files[0];
};

const clearInput = () => {
  data.profileImage = null;
  data.profileImageKey += 1;
};

const data = reactive({
  profileImage: null,
  profileImageKey: 0,
});

const changeProfileImage = async () => {
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
    authStore.setAccessToken(response.data.access_token);
    authStore.setRoles(response.data.user.roles);
    authStore.setIsLoggedIn();
  } catch (error) {
    console.log(error);
  } finally {
    authStore.isLoading = false;
  }
};
</script>

<style scoped>
</style>