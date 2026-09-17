<template>
  <router-link
    class="card m-2 shadow shadow-sm"
    style="max-width: 300px; text-decoration: none"
    :to="'/product/' + product.slug"
  >
    <img
      :src="`${BASE_URL}/` + product.thumbnail"
      class="card-img-top"
      alt="Product Image"
    />
    <div class="card-body">
      <h5 class="card-title">{{ product.name }}</h5>
      <p class="card-text">{{ product.description.substr(0, 100) }}...</p>
      <div class="d-flex justify-content-between align-items-center">
        <span class="h5 mb-0">${{ product.price }}</span>
        <div class="d-flex justify-content-between">
          <div
            v-for="color in product.colors"
            :key="color.id"
            :style="{
              backgroundColor: color.name,
              width: '10px',
              height: '10px',
              borderRadius: '10px',
              marginRight: '5px',
            }"
          ></div>
        </div>
        <div class="d-flex justify-content-between">
          <span
            v-for="size in product.sizes"
            :key="size.id"
            class="badge bg-light text-black"
            >{{ size.name }}</span
          >
        </div>
      </div>
    </div>
    <div class="card-footer d-flex justify-content-between bg-light"></div>
  </router-link>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";

const data = defineProps({
  product: {
    type: Object,
    required: true,
  },
});
</script>

<style scoped>
</style>