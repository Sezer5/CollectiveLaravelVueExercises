<template>
  <nav
    class="navbar navbar-expand-lg bg-body-tertiary px-3 border border-3 border-secondary"
  >
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Home</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/profile">Profile</router-link>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Dropdown
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
          </li>
        </ul>
        <div class="dropdown border border-2">
          <button
            class="btn btn-light dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            {{ authStore.user?.name }}
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li>
              <button class="dropdown-item" @click="logoutUser()">
                Logout
              </button>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { BASE_URL, headerConfig } from "@/helpers/config";
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
      headerConfig(authStore.access_token)
    );
    authStore.clearAuth();
    authStore.setLoggedOut();
    router.push("/login");
  } catch (error) {}
};

const currentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headerConfig(authStore.access_token)
    );
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
  } catch (error) {
    console.error("Hata detayı:", error.response);
  }
};

onMounted(() => {
  currentUser();
});
</script>

<style scoped>
</style>