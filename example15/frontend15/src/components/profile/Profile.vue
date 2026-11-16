<template>
  <div>
    <Navbar />
    <div class="col-md-12 d-flex justify-content-between mt-1">
      <Profile_sidebar />
      <Profile_content />
    </div>
  </div>
</template>

<script setup>
import Navbar from "../layouts/Navbar.vue";
import Profile_content from "./Profile_content.vue";
import Profile_sidebar from "./Profile_sidebar.vue";
</script>

<style scoped>
</style>