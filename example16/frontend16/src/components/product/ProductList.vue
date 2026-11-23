<template>
  <div>
    <Spinner :isLoading="productStore.isLoading" />
    <div class="d-flex justify-content-between flex-wrap p-3">
      <ProductListItem
        v-for="product in productStore.products.slice(0, data.itemNumber)"
        :key="product.id"
        :product="product"
      />
    </div>
    <div class="d-flex justify-content-center">
      <button class="btn btn-dark btn-dark" @click="data.itemNumber += 3">
        <i class="bi bi-arrow-clockwise"></i> Load More
      </button>
    </div>
  </div>
</template>
<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { onMounted, reactive } from "vue";
import Spinner from "../layouts/Spinner.vue";
import ProductListItem from "./ProductListItem.vue";

const productStore = useProductStore();

const data = reactive({
  itemNumber: 3,
});

onMounted(() => {
  productStore.getAllProducts();
});
</script>
<style scoped></style>