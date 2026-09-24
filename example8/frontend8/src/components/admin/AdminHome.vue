<template>
  <div class="col-md-12 d-flex justify-content-between">
    <Sidebar />
    <div class="card vh-100 w-100 p-3">Deneme</div>
  </div>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore";
import Sidebar from "./layouts/Sidebar.vue";

const authSote = useAuthStore();
</script>

<style scoped>
</style>