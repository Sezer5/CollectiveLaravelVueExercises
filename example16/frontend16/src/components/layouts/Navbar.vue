<template>
  <nav
    class="navbar navbar-expand-lg bg-body-tertiary border border-2 border-black mb-2"
  >
    <Spinner :isLoading="authStore.isLoading" />
    <div class="container-fluid">
      <a class="navbar-brand" href="/">Navbar</a>
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
            <a class="nav-link active" aria-current="page" href="/"
              ><i class="bi bi-house-fill"></i> Home</a
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/cart"
              ><i class="bi bi-cart-fill"></i> Cart ({{
                cartStore.cartItems?.length
              }})</router-link
            >
          </li>
          <li class="nav-item" v-if="!authStore.isLoggedIn">
            <router-link class="nav-link active" aria-current="page" to="/login"
              ><i class="bi bi-person-fill"></i> Login</router-link
            >
          </li>
          <li class="nav-item" v-if="!authStore.isLoggedIn">
            <router-link
              class="nav-link active"
              aria-current="page"
              to="/register"
              ><i class="bi bi-person-plus-fill"></i> Register</router-link
            >
          </li>
          <li class="nav-item dropdown" v-if="authStore.isLoggedIn">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="bi bi-person-fill"></i> {{ authStore.user?.name }}
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profile</router-link
                >
              </li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <a
                  class="dropdown-item text-danger"
                  href="#"
                  @click="logoutUser()"
                  >Logout</a
                >
              </li>
            </ul>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
          />
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore";
import { useCartStore } from "@/stores/useCartStore";
import { useRouter } from "vue-router";
import Spinner from "./Spinner.vue";
import axios from "axios";
import { BASE_URL, headersConfig } from "@/helpers/config";
import { onMounted } from "vue";

const cartStore = useCartStore();

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
    authStore.setLoggedIn();
    authStore.setRoles(response.data.user.roles);
  } catch (error) {
    authStore.clearAuth();
  } finally {
    authStore.isLoading = false;
  }
};

onMounted(() => {
  takeCurrentUser();
});
</script>

<style scoped>
</style>