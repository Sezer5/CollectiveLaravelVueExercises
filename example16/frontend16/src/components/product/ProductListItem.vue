<template>
  <div class="card my-3" style="max-width: 320px">
    <img
      :src="`${BASE_URL}/` + data?.product.thumbnail"
      class="card-img-top"
      alt="Product Image"
    />
    <div class="card-body">
      <h5 class="card-title">{{ data?.product?.name }}</h5>
      <p class="card-text">
        {{ data?.product?.description.slice(0, 40) }}...(Read More...)
      </p>
      <div class="d-flex justify-content-between align-items-center">
        <span class="h5 mb-0">${{ data?.product?.price }}</span>
        <div>
          <span class="badge bg-info">{{ data?.product?.category?.name }}</span>
        </div>
      </div>
      <div class="d-flex justify-content-between align-items-center mt-2">
        <div class="d-flex">
          <div
            v-for="color in data?.product?.colors"
            :key="color.id"
            :style="{
              backgroundColor: color.name,
              width: '10px',
              height: '10px',
              margin: '1px',
              borderRadius: '10px',
            }"
          ></div>
        </div>
        <div class="d-flex">
          <span
            class="badge bg-light text-black border border-black"
            v-for="size in data?.product?.sizes"
            :key="size.id"
            >{{ size.name }}</span
          >
        </div>
      </div>
    </div>
    <div class="card-footer d-flex justify-content-between bg-light">
      <router-link
        class="btn btn-primary btn-sm"
        :to="`/productdetail/` + data.product?.slug"
      >
        <i class="bi bi-eye"></i>
      </router-link>
    </div>
  </div>
</template>
<script setup>
import { BASE_URL } from "@/helpers/config";

const data = defineProps({
  product: {
    type: Object,
    required: false,
  },
});
</script>
<style scoped></style>