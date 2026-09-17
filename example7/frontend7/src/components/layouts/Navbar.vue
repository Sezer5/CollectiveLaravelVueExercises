<template>
  <nav
    class="navbar sticky-top navbar-expand-lg bg-light shadow-sm border border-2"
  >
    <div class="container-fluid">
      <div class="d-flex justify-content-center align-items-center">
        <img
          src="https://cdn.pixabay.com/photo/2012/04/16/11/34/shopping-35594_1280.png"
          width="60"
        />
        <a class="navbar-brand" href="/">Vue</a>
      </div>

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
            <router-link class="nav-link active" aria-current="page" to="/"
              ><i class="bi bi-house-fill"></i> Home</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/cart"
              ><i class="bi bi-cart-fill"></i> Cart ({{
                cartStore.cartItems.length
              }})</router-link
            >
          </li>
          <li class="nav-item" v-if="!authStore.isLoggedIn">
            <router-link
              class="nav-link active"
              aria-current="page"
              to="/register"
              ><i class="bi bi-person-plus"></i> Register</router-link
            >
          </li>
          <li class="nav-item" v-if="!authStore.isLoggedIn">
            <router-link class="nav-link active" aria-current="page" to="/login"
              ><i class="bi bi-person"></i> Login</router-link
            >
          </li>
          <li class="nav-item dropdown" v-else>
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="bi bi-person"></i> {{ authStore.user?.name }}
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profile</router-link
                >
              </li>
              <li><a class="dropdown-item" href="#">Orders</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <a
                  class="dropdown-item"
                  @click="logoutUser()"
                  style="cursor: pointer"
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
            v-model="data.term"
          />
          <button
            class="btn btn-outline-success"
            type="submit"
            @click="productStore.fetchProductsByTerm(data.term)"
          >
            Search
          </button>
        </form>
      </div>
    </div>
  </nav>
</template>
<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import { useCartStore } from "@/stores/useCartStore";
import { useProductStore } from "@/stores/useProductStore";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";

const productStore = useProductStore();

const data = reactive({
  term: "",
});

const cartStore = useCartStore();

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
    authStore.isLoggedIn = false;
    router.push("/login");
  } catch (error) {
    console.log(error);
  }
};

const fetchCurrentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
  } catch (error) {
    console.log(error);
  }
};

onMounted(() => {
  if (authStore.isLoggedIn) {
    fetchCurrentUser();
  }
});
</script>
<style scoped>
</style>
