<template>
  <div>
    <ul v-for="(errors, index) in authStore.validationErrors" :key="index">
      <li
        v-for="(error, index) in errors"
        :key="index"
        class="alert alert-danger"
        style="list-style-type: none"
      >
        {{ error }}
      </li>
    </ul>
  </div>
</template>

<script setup>
import { useAuthStore } from "@/stores/useAuthStore";

const authStore = useAuthStore();
</script>

<style scoped>
</style>