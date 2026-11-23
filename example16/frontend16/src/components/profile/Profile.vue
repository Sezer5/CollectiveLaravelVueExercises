<template>
  <div>
    <Navbar />
    <Spinner />
    <div class="col-md-12 d-flex justify-content-between">
      <Profile_sidebar />
      <Profile_content />
    </div>
  </div>
</template>
<script setup>
import Navbar from "../layouts/Navbar.vue";
import Spinner from "../layouts/Spinner.vue";
import Profile_content from "./Profile_content.vue";
import Profile_sidebar from "./Profile_sidebar.vue";
</script>
<style scoped>
</style>