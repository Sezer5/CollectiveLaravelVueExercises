<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
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
            <router-link class="nav-link active" aria-current="page" to="/cart"
              ><i class="bi bi-cart-plus"></i> Cart ({{
                cartStore.cartItems.length
              }})</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/register"
              ><i class="bi bi-person-plus"></i> Register</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/login"
              ><i class="bi bi-box-arrow-right"></i> Login</router-link
            >
          </li>
        </ul>
        <form
          class="d-flex"
          @submit.prevent="productStore.fecthProductsTerm(data.term)"
        >
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
            v-model="data.term"
          />
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="bi bi-person"></i> Profile
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profile</router-link
                >
              </li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { useCartStore } from "@/stores/useCartStore";
import { useProductStore } from "@/stores/useProductStore";
import { reactive } from "vue";

const productStore = useProductStore();
const cartStore = useCartStore();

const data = reactive({
  term: "",
});
</script>

<style scoped>
</style>