<template>
  <div class="col-md-12 d-flex justify-content-between">
    <Spinner :isLoading="productStore.isLoading" />
    <Sidebar />
    <ProductList />
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore";
import Spinner from "./layouts/Spinner.vue";
import { onMounted } from "vue";
import Sidebar from "./layouts/Sidebar.vue";
import ProductList from "./product/ProductList.vue";

const productStore = useProductStore();

onMounted(() => {
  productStore.fecthAllProducts();
});
</script>

<style scoped></style>