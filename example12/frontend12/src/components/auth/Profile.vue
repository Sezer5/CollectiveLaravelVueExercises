<template>
  <div class="col-md-12 d-flex justify-content-center">
    <div class="card mt-4 col-md-4">
      <div class="card-header">Profile Image</div>
      <div class="card-body">
        <div
          class="d-flex justify-content-center mb-3"
          v-if="!authStore.user?.profile_image"
        >
          <img
            src="https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png"
            width="240"
            class="border rounded-circle shadow"
          />
        </div>
        <div class="d-flex justify-content-center mb-3" v-else>
          <img
            :src="`${BASE_URL}/` + authStore.user?.profile_image"
            width="240"
            class="border rounded-circle shadow"
          />
        </div>
        <div class="d-flex justify-content-center mb-3">
          <form @submit.prevent="updateProfileImage()" method="POST">
            <div class="d-flex justify-content-center mb-3">
              <input
                type="file"
                class="form-control"
                name="profile_image"
                style="border-radius: 10px 0px 0px 10px"
                @change="handleChange"
                :key="data.imageKey"
              />
              <button
                class="btn btn-secondary"
                style="border-radius: 0px 10px 10px 0px"
                type="submit"
              >
                <i class="bi bi-upload"></i>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="card mt-4 col-md-8">
      <div class="card-header">Profile Information</div>
      <div class="card-body">Profile Image</div>
    </div>
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

const clearInputData = () => {
  data.profile_image = null;
  data.imageKey += 1;
};

const handleChange = (event) => {
  data.profile_image = event.target.files[0];
};

const updateProfileImage = async () => {
  const formData = new FormData();
  formData.append("profile_image", data.profile_image);
  formData.append("_method", "PUT");
  try {
    const response = await axios.put(
      `${BASE_URL}/api/user/update`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
    );
    authStore.setUser(response.data.user);
    clearInputData();
  } catch (error) {
    console.log(error);
  }
};
</script>

<style scoped>
</style>