<template>
  <div
    class="d-flex justify-content-between flex-wrap shadow shadow-sm border border-2"
  >
    <Spinner :isLoading="productStore.isLoading" />
    <ProductListItem
      v-for="product in productStore.products"
      :key="product.id"
      :product="product"
    />
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore.js";
import ProductListItem from "./ProductListItem.vue";
import { onMounted } from "vue";
import Spinner from "../layouts/Spinner.vue";

const productStore = useProductStore();

onMounted(() => {
  productStore.fetchAllProducts();
});
</script>

<style scoped>
</style>