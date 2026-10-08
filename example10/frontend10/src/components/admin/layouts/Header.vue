<template>
  <div class="w-100 p-3 border border-3 text-end">
    <button class="btn btn-danger btn-sm" @click="logoutUser()">
      <i class="bi bi-power"></i>
    </button>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helper/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted } from "vue";
import { useRouter } from "vue-router";

const authStore = useAuthStore();
const router = useRouter();

const logoutUser = async () => {
  try {
    const response = await axios.post(
      `${BASE_URL}/api/user/logout`,
      null,
      headersConfig(authStore.access_token)
    );
    authStore.clearAuthData();
    authStore.clearLoggedIn();
    router.push("/login");
  } catch (error) {
    console.log(error);
  }
};

const setCurrentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setLoggedIn();
  } catch (error) {
    if (error.response.status === 401) {
      authStore.clearAuthData();
      authStore.clearLoggedIn();
      router.push("/login");
    }
  }
};

onMounted(() => {
  setCurrentUser();
});
</script>

<style scoped>
</style>