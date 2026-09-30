<template>
  <div class="d-flex flex-wrap justify-content-between p-2">
    <Spinner :isLoading="productStore.isLoading" />
    <ProductListItem
      v-for="product in productStore.products"
      :key="product.id"
      :product="product"
    />
  </div>
</template>
<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { onMounted } from "vue";
import Spinner from "../layouts/Spinner.vue";
import ProductListItem from "./ProductListItem.vue";

const productStore = useProductStore();

onMounted(() => productStore.fetchProducts());
</script>
<style scoped></style>