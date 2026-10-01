<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm mb-2">
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
            <a class="nav-link active" aria-current="page" href="#"
              ><i class="bi bi-house-fill"></i> Home</a
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/cart"
              ><i class="bi bi-cart-plus-fill"></i> Cart ({{
                cartStore.cartItems.length
              }})</router-link
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Dropdown
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a
              class="nav-link disabled"
              href="#"
              tabindex="-1"
              aria-disabled="true"
              >Disabled</a
            >
          </li>
        </ul>
        <form class="d-flex">
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
        <div class="mx-1" v-if="!authStore.isLoggedIn">
          <router-link
            class="btn btn-outline-success mx-1"
            type="submit"
            :to="`/login`"
          >
            Login
          </router-link>
          <router-link
            class="btn btn-outline-success mx-1"
            type="submit"
            :to="`/register`"
          >
            Register
          </router-link>
        </div>
        <div class="mx-1" v-else>
          <router-link
            class="btn btn-outline-success mx-1"
            type="submit"
            :to="`/profile`"
          >
            <i class="bi bi-person-fill"></i> {{ authStore.user?.name }}
          </router-link>
          <button
            class="btn btn-outline-danger mx-1"
            type="submit"
            @click="logoutUser()"
          >
            <i class="bi bi-power"></i>
          </button>
        </div>
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
import { useToast } from "vue-toastification";

const productStore = useProductStore();
const cartStore = useCartStore();
const authStore = useAuthStore();
const router = useRouter();
const toast = useToast();
const data = reactive({
  term: "",
});

const currentUser = async () => {
  try {
    const response = await axios.get(
      `${BASE_URL}/api/user`,
      headersConfig(authStore.access_token)
    );
  } catch (error) {
    if (error.response.status === 401) {
      authStore.clearAuthData();
    }
  }
};

const logoutUser = async () => {
  try {
    const response = await axios.post(
      `${BASE_URL}/api/user/logout`,
      null,
      headersConfig(authStore.access_token)
    );
    authStore.clearAuthData();
    router.push("/login");
    toast.success(response.data.message, {
      timeout: 2000,
    });
  } catch (error) {
    console.log(error);
  }
};

onMounted(() => {
  if (authStore.isLoggedIn) {
    currentUser();
  }
});
</script>

<style scoped>
</style>