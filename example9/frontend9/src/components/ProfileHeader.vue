<template>
  <div class="col-md-12 my-3 shadow-sm p-3">
    <div v-if="!authStore.user.profile_image">
      <img
        src="https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png"
        width="120"
        class="rounded-circle border border-black border-3"
      />
    </div>
    <div v-else>
      <img
        :src="`${BASE_URL}/` + authStore.user?.profile_image"
        width="120"
        class="rounded-circle border border-black border-3"
      />
    </div>
    <form @submit.prevent="changeProfileImage()">
      <div class="d-flex justify-content-between col-md-4 mt-5">
        <input
          type="file"
          class="form-control"
          @change="handleFilechange"
          :key="data.imageKey"
        />
        <button class="btn btn-sm btn-dark" type="submit">
          <i class="bi bi-upload"></i>
        </button>
      </div>
    </form>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { reactive } from "vue";

const authStore = useAuthStore();

const data = reactive({
  profile_image: null,
  imageKey: 0,
});

const clearInput = () => {
  data.profile_image = null;
  data.imageKey++;
};

const handleFilechange = (event) => {
  data.profile_image = event.target.files[0];
};

const changeProfileImage = async () => {
  const formData = new FormData();
  formData.append("profile_image", data.profile_image);
  formData.append("_method", "PUT");
  try {
    const response = await axios.post(
      `${BASE_URL}/api/user/update`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
    );
    authStore.setUser(response.data.user);
    clearInput();
  } catch (error) {
    console.log(error);
  }
};
</script>

<style scoped></style>