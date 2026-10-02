<template>
  <div class="text-end border border-3 p-3 rounded rounded-5 bg-light">
    <button class="btn btn-dark" @click="logoutUser()">Quit</button>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
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
    router.push("/login");
  } catch (error) {
    console.log(error);
  }
};

const currentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
    authStore.setUser(response.data.user);
    authStore.setToken(response.data.access_token);
    authStore.setIsLoggedIn();
  } catch (error) {
    if (error.response.status) {
      authStore.clearAuthData();
      router.push("/login");
    }
  }
};

onMounted(() => {
  if (authStore.isLoggedIn) {
    currentUser();
  }
});
</script>

<style scoped></style>