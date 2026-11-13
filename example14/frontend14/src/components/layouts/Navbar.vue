<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
    <Spinner :isLoading="authStore.isLoading" />
    <div class="container-fluid">
      <!-- Brand / Logo -->
      <a class="navbar-brand fw-bold" href="#">
        <i class="bi bi-code-slash me-1"></i> Niğtaş Connect
      </a>

      <!-- Mobil Menü Butonu (Hamburger) -->
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#mainNavbarContent"
        aria-controls="mainNavbarContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Navbar İçeriği -->
      <div class="collapse navbar-collapse" id="mainNavbarContent">
        <!-- Sol Menü (Ana Navigasyon ve Açılır Menüler) -->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Anasayfa</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="#">Finansal Durum</a>
          </li>

          <!-- 1. Açılır Menü (Yönetim / İşlemler) -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Yönetim
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Kullanıcı Listesi</a></li>
              <li>
                <a class="dropdown-item" href="#">Hesap Kayıt İstekleri</a>
              </li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Raporlar ve Loglar</a></li>
            </ul>
          </li>

          <!-- 2. Açılır Menü (Kategoriler / Tanımlar) -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Tanımlamalar
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Kategoriler</a></li>
              <li>
                <a class="dropdown-item" href="#">Renkler ve Varyantlar</a>
              </li>
              <li><a class="dropdown-item" href="#">Sistem Ayarları</a></li>
            </ul>
          </li>
        </ul>

        <!-- Arama Çubuğu -->
        <form class="d-flex me-3" role="search">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Ara..."
            aria-label="Search"
          />
          <button class="btn btn-outline-primary" type="submit">Ara</button>
        </form>

        <!-- Sağ Menü (Profil, Bildirimler ve Çıkış) -->
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0" v-if="authStore.isLoggedIn">
          <!-- Profil / Kullanıcı Açılır Menüsü -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle d-flex align-items-center"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <span
                class="bg-secondary text-white rounded-circle d-inline-flex align-items-center justify-content-center me-1"
                style="width: 28px; height: 28px; font-size: 12px"
              >
                SÜ
              </span>
              Hesabım
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profil Bilgileri</router-link
                >
              </li>
              <li><a class="dropdown-item" href="#">Ayarlar</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <a
                  class="dropdown-item text-danger"
                  href="#"
                  @click="logoutUser()"
                  >Çıkış Yap</a
                >
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
import { useRouter } from "vue-router";
import Spinner from "./Spinner.vue";
import { onMounted } from "vue";

const authStore = useAuthStore();
const router = useRouter();

const logoutUser = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user/logout`,
      headersConfig(authStore.access_token)
    );
    authStore.clearAuth();
    router.push("/login");
  } catch (error) {
    console.log(error);
  } finally {
    authStore.isLoading = false;
  }
};

const takeCurrentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setRoles(response.data.user.roles);
    authStore.setLoggedIn();
  } catch (error) {
    if (error.response.status === 401) {
      authStore.clearAuth();
      router.push("/login");
    }
  }
};

onMounted(() => {
  takeCurrentUser();
});
</script>

<style scoped>
/* Özel stillerinizi buraya ekleyebilirsiniz */
</style>