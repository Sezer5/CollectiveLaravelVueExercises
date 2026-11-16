<template>
  <div>
    <ul
      class="validationErrorStyles alert alert-danger"
      v-for="(errors, index) in data.validationErrors"
      :key="index"
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
.validationErrorStyles {
  list-style-type: none;
}
</style>