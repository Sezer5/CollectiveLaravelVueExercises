<template>
  <div class="mt-1 d-flex justify-content-between">
    <Sidebar />
    <ProductList />
  </div>
</template>
<script setup>
import Sidebar from "./layouts/Sidebar.vue";
import ProductList from "./product/ProductList.vue";
</script>
<style scoped>
</style>
