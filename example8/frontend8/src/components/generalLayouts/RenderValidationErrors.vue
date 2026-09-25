<template>
  <div>
    <ul v-for="(errors, index) in validationErrors" :key="index">
      <li
        class="alert alert-danger"
        style="list-style-type: none"
        v-for="(error, index) in errors"
        :key="index"
      >
        {{ error }}
      </li>
    </ul>
  </div>
</template>

<script setup>
const data = defineProps({
  validationErrors: {
    type: Object,
    required: false,
  },
});
</script>

<style scoped>
</style>