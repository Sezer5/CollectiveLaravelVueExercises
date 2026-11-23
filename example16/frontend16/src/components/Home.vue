<template>
  <div>
    <Navbar />
    <div class="d-flex justify-content-between col-lg-12 border border-2 p-1">
      <Sidebar />
      <ProductList />
    </div>
  </div>
</template>

<script setup>
import Navbar from "./layouts/Navbar.vue";
import Sidebar from "./layouts/Sidebar.vue";
import ProductList from "./product/ProductList.vue";
</script>

<style scoped>
</style>