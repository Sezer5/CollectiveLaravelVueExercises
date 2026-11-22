<template>
  <div>
    <Navbar />
    <div class="col-lg-12 vh-100 border border-2 p-1">
      <Sidebar />
    </div>
  </div>
</template>

<script setup>
import Navbar from "./layouts/Navbar.vue";
import Sidebar from "./layouts/Sidebar.vue";
</script>

<style scoped>
</style>