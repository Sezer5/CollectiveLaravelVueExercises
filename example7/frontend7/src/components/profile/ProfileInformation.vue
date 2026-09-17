<template>
  <div class="card w-100">
    <div class="card-header">
      <h3>Profile</h3>
    </div>
    <div class="card-body">
      <div class="col-md-4">
        <form @submit.prevent="updateUserInfo()">
          <div class="mb-3">
            <label for="" class="form-label">Address</label>
            <input
              type="text"
              class="form-control"
              v-model="data.user.address"
            />
          </div>
          <div class="mb-3">
            <label for="" class="form-label">Country</label>
            <input
              type="text"
              class="form-control"
              v-model="data.user.country"
            />
          </div>
          <div class="mb-3">
            <label for="" class="form-label">ZipCode</label>
            <input
              type="text"
              class="form-control"
              v-model="data.user.zip_code"
            />
          </div>
          <div class="mb-3 text-end">
            <button class="btn btn-dark">Submit</button>
          </div>
        </form>
      </div>
    </div>
    <div class="card-footer"></div>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { reactive } from "vue";

const authStore = useAuthStore();

const data = reactive({
  user: {
    address: authStore.user.address,
    country: authStore.user.country,
    zip_code: authStore.user.zip_code,
  },
});

const updateUserInfo = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.put(
      `${BASE_URL}/api/user/profile/update`,
      data.user,
      headersConfig(authStore.access_token)
    );
    authStore.user = response.data.user;
    authStore.isLoading = false;
  } catch (error) {
    console.log(error);
  }
};
</script>

<style scoped>
</style>