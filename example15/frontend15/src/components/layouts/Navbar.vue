<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
      <!-- Logo / Marka -->
      <router-link class="navbar-brand fw-bold" to="/">AppPortal</router-link>

      <!-- Mobil Menü Butonu -->
      <button
        class="navbar-toggler border-0"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Menü Öğeleri -->
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Ana Sayfa</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/gallery">Gallery</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/album">Album</router-link>
          </li>

          <!-- Açılır Menü (Dropdown) -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              İşlemler
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link class="dropdown-item" to="/"
                  >Talep Listesi</router-link
                >
              </li>
            </ul>
          </li>
        </ul>

        <!-- Sağ Taraf: Profil / Kullanıcı -->
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle d-flex align-items-center gap-2"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="bi bi-person-circle fs-5"></i>
              <span>{{ authStore.user?.name }}</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profil Bilgileri</router-link
                >
              </li>

              <li><hr class="dropdown-divider" /></li>
              <li>
                <button class="dropdown-item text-danger" @click="logout()">
                  Çıkış Yap
                </button>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted } from "vue";
import { useRouter } from "vue-router";

const authStore = useAuthStore();
const router = useRouter();

const checkAuth = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setRoles(response.data.user.roles);
    authStore.setIsLoggedIn();
  } catch (error) {
    console.log(error);
  }
};

const logout = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user/logout`,
      headersConfig(authStore.access_token)
    );
    authStore.clearAuth();
    router.push("/login");
  } catch (error) {
    console.log(error);
  }
};

onMounted(() => {
  checkAuth();
});
</script>