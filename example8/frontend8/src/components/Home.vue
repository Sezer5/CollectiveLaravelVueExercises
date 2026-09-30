<template>
  <div class="col-md-12 d-flex jsutify-content-between">
    <Sidebar />
    <ProductList />
  </div>
</template>
<script setup>
import Sidebar from "./layouts/Sidebar.vue";
import ProductList from "./product/ProductList.vue";
</script>
<style scoped></style>