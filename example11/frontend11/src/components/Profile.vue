<template>
  <div class="col-md-12">
    <Navbar />
    <div class="col-md-12 d-flex justify-content-between">
      <div class="col-md-4 border vh-100 p-3">
        <div>
          <img
            :src="`${BASE_URL}/` + authStore.user?.profile_image"
            width="120"
          />
        </div>
        <div>
          <form @submit.prevent="changeProfileImage()" method="post">
            <div class="my-3 d-flex justify-content-between">
              <input
                type="file"
                class="form-control"
                @change="handleChangeFile"
                :key="data.inputKey"
              />
              <button class="btn btn-success">
                <i class="bi bi-upload"></i>
              </button>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-8 border vh-100 p-3">Content</div>
    </div>
  </div>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore.js";
import Navbar from "./layouts/Navbar.vue";
import { useToast } from "vue-toastification";
import { BASE_URL, headerConfig } from "@/helpers/config.js";
import { reactive } from "vue";
import axios from "axios";

const authStore = useAuthStore();
const toast = useToast();

const data = reactive({
  user: {
    userPhoto: null,
    inputKey: 0,
  },
});

const handleChangeFile = (event) => {
  data.user.userPhoto = event.target.files[0];
};

const clearInput = () => {
  data.user.userPhoto = null;
  data.user.inputKey += 1;
};

const changeProfileImage = async () => {
  try {
    const formData = new FormData();
    formData.append("profile_image", data.user.userPhoto);
    formData.append("_method", "PUT");

    const response = await axios.post(
      `${BASE_URL}/api/user/update`,
      formData,
      headerConfig(authStore.access_token, "multipart/form-data")
    );
    toast.success(response.data.message, {
      timeout: 2000,
    });
    authStore.setUser(response.data.user);
    clearInput();
  } catch (error) {
    console.log(error);
  }
};
</script>

<style scoped></style>