<template>
  <div class="col-md-9 d-flex border border-3 p-3 vh-75">
    <Spinner />
    <div>Content</div>
  </div>
</template>
<script setup>
import Spinner from "../layouts/Spinner.vue";
</script>
<style scoped>
.vh-75 {
  height: 75vh;
}
</style>