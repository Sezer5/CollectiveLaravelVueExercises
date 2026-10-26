<template>
  <div class="card m-3" style="max-width: 290px">
    <img
      :src="`${BASE_URL}/` + data.product.thumbnail"
      class="card-img-top"
      alt="Product Image"
    />
    <div class="card-body">
      <h5 class="card-title">{{ data.product.name }}</h5>
      <p class="card-text">{{ data.product.description.slice(0, 75) }}...</p>
      <div class="d-flex justify-content-between align-items-center">
        <span class="h5 mb-0">${{ data.product.price }}</span>
        <div>
          <span class="badge bg-primary">{{ data.product.category.name }}</span>
        </div>
      </div>
      <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex mt-2">
          <div
            v-for="color in data.product.colors"
            :key="color.name"
            :style="{
              backgroundColor: color.name,
              width: '10px',
              height: '10px',
              borderRadius: '10px',
              marginRight: '5px',
            }"
          ></div>
        </div>
        <div class="d-flex mt-2">
          <span
            class="badge bg-secondary text-white mx-1"
            v-for="size in data.product.sizes"
            :key="size.id"
            >{{ size.name }}</span
          >
        </div>
      </div>
    </div>
    <div class="card-footer d-flex justify-content-between bg-light">
      <router-link
        class="btn btn-primary btn-sm"
        :to="`/productdetail/` + product.slug"
      >
        <i class="bi bi-eye"></i>
      </router-link>
      <button class="btn btn-outline-secondary btn-sm">
        <i class="bi bi-heart"></i>
      </button>
    </div>
  </div>
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