<template>
  <div class="col-md-12 d-flex justify-content-between">
    <Sidebar />
    <div class="d-flex flex-column w-100">
      <Header />
      <div class="d-flex">
        <div class="card w-50">
          <div class="p-3" v-if="!authStore.user?.profile_image">
            <img
              src="https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png"
              width="120"
              class="border border-3 border-black rounded-circle"
            />
          </div>
          <div class="p-3" v-else>
            <img
              :src="`${BASE_URL}/` + authStore.user?.profile_image"
              width="120"
              class="border border-3 border-black rounded-circle"
            />
          </div>
          <div class="p-3">
            <form>
              <div class="mb-3 d-flex">
                <input
                  type="file"
                  class="form-control"
                  name=""
                  id=""
                  aria-describedby="helpId"
                  @change="handleChangePhoto"
                  :key="data.imageKey"
                />
                <button
                  class="btn btn-dark"
                  style="border-radius: 0px 10px 10px 0px"
                  type="submit"
                  @click="submitProfilePhoto()"
                >
                  <i class="bi bi-upload"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
        <div class="card w-50">Profile Photo</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore";
import Header from "../layouts/Header.vue";
import Sidebar from "../layouts/Sidebar.vue";
import { useToast } from "vue-toastification";
import { BASE_URL, headersConfig } from "@/helper/config";
import { reactive } from "vue";
import axios from "axios";

const authStore = useAuthStore();
const toast = useToast();

const data = reactive({
  profilePhoto: null,
  imageKey: 0,
});

const handleChangePhoto = (event) => {
  data.profilePhoto = event.target.files[0];
};

const clearInput = () => {
  data.profilePhoto = null;
  data.imageKey += 1;
};

const submitProfilePhoto = async () => {
  const formData = new FormData();
  formData.append("profile_image", data.profilePhoto);
  formData.append("_method", "PUT");

  try {
    const response = await axios.post(
      `${BASE_URL}/api/user/update`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
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

<style scoped>
</style>