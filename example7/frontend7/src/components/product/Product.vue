<template>
  <div class="card container mt-1 p-3 shadow-sm border border-3">
    <Spinner :isLoading="productStore.isLoading" />
    <div class="row">
      <!-- Product Images -->
      <div class="col-md-6 mb-4">
        <img
          :src="`${BASE_URL}/` + productStore.productDetail?.thumbnail"
          alt="Product"
          class="img-fluid rounded mb-3 product-image"
          id="mainImage"
        />
      </div>

      <!-- Product Details -->
      <div class="col-md-6">
        <h2 class="mb-3">{{ productStore.productDetail?.name }}</h2>
        <p class="text-muted mb-4">
          SKU: {{ productStore.productDetail?.slug + makeUniqueId(20) }}
        </p>
        <div class="mb-3">
          <span class="h4 me-2">${{ productStore.productDetail?.price }}</span>
          <span class="text-muted"
            ><s>${{ productStore.productDetail?.price * 1.2 }}</s></span
          >
        </div>
        <div class="mb-3">
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-fill text-warning"></i>
          <i class="bi bi-star-half text-warning"></i>
          <span class="ms-2">4.5 (120 reviews)</span>
        </div>
        <p class="mb-4">{{ productStore.productDetail?.description }}</p>
        <div class="mb-4 d-flex justify-content-between">
          <div>
            <h5>Color:</h5>
            <div class="btn-group" role="group" aria-label="Color selection">
              <div class="d-flex">
                <div
                  v-for="color in productStore.productDetail?.colors"
                  :key="color.id"
                  :style="{
                    backgroundColor: color.name,
                    width: '30px',
                    height: '30px',
                    borderRadius: '30px',
                    marginRight: '5px',
                    display: 'flex',
                    justifyContent: 'center',
                    alignItems: 'center',
                    cursor: 'pointer',
                  }"
                  @click="data.chosenColor = color.name"
                >
                  <i
                    class="bi bi-check-lg text-white"
                    v-if="data.chosenColor === color.name"
                  ></i>
                </div>
              </div>
            </div>
          </div>
          <div>
            <h5>Size:</h5>
            <div class="btn-group" role="group" aria-label="Color selection">
              <div class="d-flex">
                <span
                  v-for="size in productStore.productDetail?.sizes"
                  :key="size.id"
                  :class="
                    data.chosenSize === size.name
                      ? 'badge bg-dark text-white p-3 mx-1 border'
                      : 'badge bg-light text-black p-3 mx-1 border'
                  "
                  style="cursor: pointer"
                  @click="data.chosenSize = size.name"
                  >{{ size.name }}</span
                >
              </div>
            </div>
          </div>
        </div>
        <div class="mb-4">
          <h5>Quantity(Max:{{ productStore.productDetail?.quantity }}):</h5>
          <input
            type="number"
            class="form-control"
            id="quantity"
            v-model="data.chosenQty"
            min="1"
            :max="productStore.productDetail?.quantity"
            style="width: 80px"
          />
        </div>
        <button
          class="btn btn-primary btn-lg mb-3 me-2"
          :disabled="!data.chosenColor || !data.chosenSize"
          @click="
            cartStore.addItem({
              ref: makeUniqueId(20),
              product_id: productStore.productDetail?.id,
              maxQty: productStore.productDetail?.quantity,
              thumbnail: productStore.productDetail?.thumbnail,
              price: productStore.productDetail?.price,
              color: data.chosenColor,
              size: data.chosenSize,
              Qty: data.chosenQty,
            })
          "
        >
          <i class="bi bi-cart-plus"></i> Add to Cart
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from "vue-router";
import Spinner from "../layouts/Spinner.vue";
import { onMounted, reactive } from "vue";
import { useProductStore } from "@/stores/useProductStore";
import { BASE_URL, makeUniqueId } from "@/helpers/config";
import { useCartStore } from "@/stores/useCartStore.js";

const term = useRoute().params.slug;

const productStore = useProductStore();

const cartStore = useCartStore();

const data = reactive({
  chosenColor: "",
  chosenSize: "",
  chosenQty: 1,
});

onMounted(() => {
  productStore.fetchProductDetail(term);
});
</script>

<style scoped>
</style>