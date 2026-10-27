<template>
  <div class="col-md-12 d-flex justify-content-between mt-3 p-3 shadow">
    <Spinner :isLoading="productStore.isLoading" />
    <div class="col-md-4">
      <img
        :src="`${BASE_URL}/` + productStore.productDetail?.thumbnail"
        width="320"
        class="photoAnimate"
      />
    </div>
    <div class="col-md-8 card p-3">
      <div class="card-header d-flex justify-content-between border">
        <h2>{{ productStore.productDetail?.name }}</h2>
        <h2>#{{ productStore.productDetail?.slug }}</h2>
        <h2>${{ productStore.productDetail?.price }}</h2>
      </div>
      <div class="card-body">
        <div class="w-100">
          {{ productStore.productDetail?.description }}
        </div>
        <div class="w-100 mt-5 d-flex justify-content-between">
          <div class="d-flex justify-content-between p-3">
            <h5>Color:</h5>
            <div class="d-flex justify-content-between">
              <div
                v-for="color in productStore.productDetail?.colors"
                :key="color.id"
                :style="{
                  backgroundColor: color.name,
                  width: '30px',
                  height: '30px',
                  cursor: 'pointer',
                  marginRight: '10px',
                  borderRadius: '100px',
                  display: 'flex',
                  justifyContent: 'center',
                  alignItems: 'center',
                  color: 'white',
                }"
                @click="chosenData.chosenColor = color.name"
              >
                <i
                  class="bi bi-check-lg"
                  style="font-size: 25px"
                  v-if="chosenData.chosenColor === color.name"
                ></i>
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-between p-3">
            <h5>Size:</h5>
            <div class="d-flex justify-content-between">
              <span
                v-for="size in productStore.productDetail?.sizes"
                :key="size.id"
                style="cursor: pointer"
                @click="chosenData.chosenSize = size.name"
                :class="
                  size.name === chosenData?.chosenSize
                    ? 'badge bg-dark text-white border border-black mx-1'
                    : 'badge bg-light text-black border border-black mx-1'
                "
              >
                {{ size.name }}
              </span>
            </div>
          </div>
          <div class="d-flex justify-content-between p-3">
            <h5>Quantity:</h5>
            <div class="d-flex justify-content-between">
              <input
                type="number"
                class="form-control"
                min="1"
                :max="productStore.productDetail?.quantity"
                v-model="chosenData.chosenQty"
              />
            </div>
          </div>
        </div>
        <div class="w-100 mt-5 text-end">
          <button
            class="btn btn-lg btn-primary"
            @click="
              cartStore.addItemToCart({
                ref: makeUniqueId(10),
                color: chosenData.chosenColor,
                size: chosenData.chosenSize,
                qty: chosenData.chosenQty,
                maxQTY: productStore.productDetail?.quantity,
                product_id: productStore.productDetail?.id,
                thumbnail: productStore.productDetail?.thumbnail,
                price: productStore.productDetail?.price,
              })
            "
          >
            <i class="bi bi-cart-plus"></i> Add Cart
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useProductStore } from "@/stores/useProductStore";
import { useRoute } from "vue-router";
import Spinner from "../layouts/Spinner.vue";
import { onMounted, reactive } from "vue";
import { BASE_URL, makeUniqueId } from "@/helpers/config";
import { DataLoaderPlugin } from "vue-router/experimental";
import { useCartStore } from "@/stores/useCartStore.js";

const productStore = useProductStore();
const cartStore = useCartStore();
const term = useRoute().params.slug;

const chosenData = reactive({
  chosenColor: "",
  chosenSize: "",
  chosenQty: 1,
});

onMounted(() => {
  productStore.fetchProductDetail(term);
});
</script>

<style scoped>
.photoAnimate {
  transition: all 0.5s ease;
}

.photoAnimate:hover {
  transform: scale(1.05);
  box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
}
</style>