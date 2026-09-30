<template>
  <router-link
    class="card mb-3 deco"
    style="max-width: 320px"
    :to="`/productDetail/${product.slug}`"
  >
    <img
      :src="`${BASE_URL}/` + product.thumbnail"
      class="card-img-top"
      alt="Product Image"
    />
    <div class="card-body">
      <h5 class="card-title">{{ product.name }}</h5>
      <p class="card-text">
        {{ product.description ? product.description.substr(0, 80) : "" }}...
      </p>

      <!-- MEVCUT RENKLER -->
      <div v-if="product.colors && product.colors.length" class="mb-2">
        <small class="d-block text-muted mb-1 fw-bold">Renkler:</small>
        <div class="d-flex gap-1 align-items-center flex-wrap">
          <span
            v-for="color in product.colors"
            :key="color.id || color.code || color"
            class="color-dot"
            :style="{ backgroundColor: color.name || color }"
            :title="color.name || color"
          ></span>
        </div>
      </div>

      <!-- MEVCUT BEDENLER -->
      <div v-if="product.sizes && product.sizes.length" class="mb-3">
        <small class="d-block text-muted mb-1 fw-bold">Bedenler:</small>
        <div class="d-flex gap-1 flex-wrap">
          <span
            v-for="size in product.sizes"
            :key="size.id || size"
            class="badge bg-light text-dark border"
          >
            {{ size.name || size }}
          </span>
        </div>
      </div>

      <div class="d-flex justify-content-between align-items-center mt-2">
        <span class="h5 mb-0">${{ product.price }}</span>
        <div>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-half text-warning"></i>
          <small class="text-muted">(4.5)</small>
        </div>
      </div>
    </div>

    <div class="card-footer d-flex justify-content-between bg-light">
      <button class="btn btn-primary btn-sm">Add to Cart</button>
      <button class="btn btn-outline-secondary btn-sm">
        <i class="bi bi-heart"></i>
      </button>
    </div>
  </router-link>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";

const props = defineProps({
  product: {
    type: Object,
    required: true,
  },
});
</script>

<style scoped>
/* Renk yuvarlakları için statik gösterim */
.color-dot {
  width: 18px;
  height: 18px;
  border-radius: 50%;
  border: 1px solid #ccc;
  display: inline-block;
}

.deco {
  text-decoration: none;
}
</style>