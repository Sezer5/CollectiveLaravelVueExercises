<template>
  <div>
    <ul
      v-for="(errors, index) in validationErrors"
      :key="index"
      class="alert alert-danger"
    >
      <li v-for="(error, index) in errors" :key="index">
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
ul {
  list-style-type: none;
}
</style>