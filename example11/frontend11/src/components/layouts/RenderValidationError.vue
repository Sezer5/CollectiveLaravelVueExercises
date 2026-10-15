<template>
  <div>
    <ul v-for="(errors, index) in data.validationErrors" :key="index">
      <li
        v-for="(error, index) in errors"
        :key="index"
        style="list-style-type: none"
        class="alert alert-danger"
      >
        {{ error }}
      </li>
    </ul>
  </div>
</template>

<script setup>
const data = defineProps({
  validationErrors: {
    required: false,
    type: Object,
  },
});
</script>

<style scoped>
</style>