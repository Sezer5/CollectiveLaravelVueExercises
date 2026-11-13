<template>
  <div>
    <Navbar />
    <div class="col-md-12 d-flex justify-content-between">
      <Spinner :isLoading="authStore.isLoading" />
      <div class="col-md-3 vh-100 border border-2">
        <div class="text-center">
          <h3>Profile</h3>
        </div>
        <div>
          <div>
            <div class="text-center">
              <img
                v-if="!authStore.user?.profile_image"
                src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
                width="160"
                class="rounded-circle border border-3 border-black"
              />
              <img
                v-else
                :src="`${BASE_URL}/` + authStore.user?.profile_image"
                width="160"
                class="rounded-circle border border-3 border-black"
              />
            </div>
            <form @submit.prevent="updateProfileImage()">
              <div class="my-2 d-flex p-2">
                <input
                  type="file"
                  class="form-control"
                  @change="handleProfileImageChange"
                  :key="data.profileImageKey"
                />
                <button
                  class="btn btn-light border border-1 border-black"
                  type="submit"
                >
                  <i class="bi bi-upload"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-9 vh-100 border border-2"></div>
    </div>
  </div>
</template>
<script setup>
import { useAuthStore } from "@/stores/useAuthStore.js";
import Navbar from "./layouts/Navbar.vue";
import { useToast } from "vue-toastification";
import { BASE_URL, headersConfig } from "@/helpers/config.js";
import { reactive } from "vue";
import Spinner from "./layouts/Spinner.vue";
import axios from "axios";

const authStore = useAuthStore();
const toast = useToast();

const data = reactive({
  profileImage: "",
  profileImageKey: 0,
});

const handleProfileImageChange = (event) => {
  data.profileImage = event.target.files[0];
};

const clearInput = () => {
  data.profileImage = "";
  data.profileImageKey += 1;
};

const updateProfileImage = async () => {
  const formData = new FormData();
  formData.append("profile_image", data.profileImage);
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
<style scoped></style>