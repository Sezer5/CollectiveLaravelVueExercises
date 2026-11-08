<template>
  <div>
    <ul
      v-for="(errors, index) in validationErrors"
      :key="index"
      style="list-style-type: none"
    >
      <li
        class="alert alert-danger"
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
    required: true,
  },
});
</script>

<style scoped>
</style>