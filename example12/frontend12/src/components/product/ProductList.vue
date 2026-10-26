<template>
  <div class="w-100 d-flex justify-content-between flex-wrap">
    <ProductListItem
      v-for="product in productStore.products"
      :key="product.id"
      :product="product"
    />
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";
import { useProductStore } from "@/stores/useProductStore";
import ProductListItem from "./ProductListItem.vue";

const productStore = useProductStore();
</script>

<style scoped>
</style>