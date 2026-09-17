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
            <router-link class="nav-link active" aria-current="page" to="/"
              ><i class="bi bi-cart-fill"></i> Cart ({{
                cartStore.cartItems.length
              }})</router-link
            >
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
import { useCartStore } from "@/stores/useCartStore";
import { useProductStore } from "@/stores/useProductStore";
import { reactive } from "vue";

const productStore = useProductStore();

const data = reactive({
  term: "",
});

const cartStore = useCartStore();
</script>
<style scoped>
</style>
