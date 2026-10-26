<template>
  <div class="flex-shrink-0 p-3 border border-3 vh-100" style="width: 280px">
    <a
      href="/"
      class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom"
    >
      <svg class="bi pe-none me-2" width="30" height="24" aria-hidden="true">
        <use xlink:href="#bootstrap"></use>
      </svg>
      <span class="fs-5 fw-semibold">Categories</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button
          class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
          data-bs-toggle="collapse"
          data-bs-target="#home-collapse"
          aria-expanded="true"
        >
          Categories
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li
              v-for="category in productStore.categories"
              :key="category.id"
              @click="productStore.fecthProductsCategories(category.slug)"
            >
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >{{ category.name }}</a
              >
            </li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button
          class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
          data-bs-toggle="collapse"
          data-bs-target="#dashboard-collapse"
          aria-expanded="false"
        >
          Colors
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li
              v-for="color in productStore.colors"
              :key="color.id"
              @click="productStore.fecthProductsColor(color.slug)"
            >
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >{{ color.name }}</a
              >
            </li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button
          class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
          data-bs-toggle="collapse"
          data-bs-target="#orders-collapse"
          aria-expanded="false"
        >
          Sizes
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li
              v-for="size in productStore.sizes"
              :key="size.id"
              @click="productStore.fecthProductsSize(size.slug)"
            >
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >{{ size.name }}</a
              >
            </li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button
          class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
          data-bs-toggle="collapse"
          data-bs-target="#account-collapse"
          aria-expanded="false"
        >
          Account
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li>
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >New...</a
              >
            </li>
            <li>
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >Profile</a
              >
            </li>
            <li>
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >Settings</a
              >
            </li>
            <li>
              <a
                href="#"
                class="link-body-emphasis d-inline-flex text-decoration-none rounded"
                >Sign out</a
              >
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup>
import "@/assets/sidebars.css";
import { useProductStore } from "@/stores/useProductStore";

const productStore = useProductStore();
</script>

<style scoped>
</style>