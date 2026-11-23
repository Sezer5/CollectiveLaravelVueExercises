<template>
  <div>
    <Navbar />
    <Spinner :isLoading="productStore.isLoading" />
    <div class="col-md-12 d-flex">
      <div class="col-md-4">
        <img
          :src="`${BASE_URL}/` + productStore.productdetail?.thumbnail"
          class="rounded rounded-5 w-100"
        />
      </div>
      <div class="col-md-8 p-3">
        <div class="card">
          <div class="card-header d-flex justify-content-between">
            <h3>{{ productStore.productdetail?.name }}</h3>
            <h3>$ {{ productStore.productdetail?.price }}</h3>
          </div>
          <div class="card-body">
            <div
              class="bg-light p-3 border border-3 border-gray rounded rounded-3 border-dashed"
            >
              <h5>Description</h5>
              {{ productStore.productdetail?.description }}
            </div>
            <div
              class="bg-light p-3 border border-3 border-gray rounded rounded-3 border-dashed mt-3"
            >
              <h5>Colors:</h5>
              <div class="d-flex">
                <div
                  v-for="color in productStore.productdetail?.colors"
                  :key="color.id"
                  :style="{
                    backgroundColor: color.name,
                    width: '30px',
                    height: '30px',
                    borderRadius: '30px',
                    marginRight: '10px',
                    display: 'flex',
                    justifyContent: 'center',
                    alignItems: 'center',
                  }"
                  class="cursor-pointer"
                  @click="data.chosen.color = color.name"
                >
                  <i
                    class="bi bi-check-lg fs-3 text-white"
                    v-if="data.chosen.color === color.name"
                  ></i>
                </div>
              </div>
            </div>
            <div
              class="bg-light p-3 border border-3 border-gray rounded rounded-3 border-dashed mt-3"
            >
              <h5>Sizes:</h5>
              <div class="d-flex">
                <span
                  :class="
                    data.chosen.size === size.name
                      ? 'badge bg-dark p-3 text-white border border-black cursor-pointer mx-1'
                      : 'badge bg-light p-3 text-black border border-black cursor-pointer mx-1'
                  "
                  v-for="size in productStore.productdetail?.sizes"
                  :key="size.id"
                  @click="data.chosen.size = size.name"
                >
                  {{ size.name }}
                </span>
              </div>
            </div>
            <div
              class="bg-light p-3 border border-3 border-gray rounded rounded-3 border-dashed mt-3"
            >
              <h5>Quantity:</h5>
              <div class="d-flex justify-content-between">
                <div class="w-50">
                  <input
                    type="number"
                    class="form-control"
                    min="1"
                    :max="productStore.productdetail?.quantity"
                    v-model="data.chosen.quantity"
                  />
                </div>
                <div class="w-50 text-end">
                  <button
                    class="btn btn-success"
                    :disabled="
                      !data.chosen.quantity ||
                      !data.chosen.size ||
                      !data.chosen.color
                    "
                    @click="
                      cartStore.addItem({
                        unique_id: makeUniqueId(10),
                        product_id: productStore.productdetail?.id,
                        name: productStore.productdetail?.name,
                        color: data.chosen.color,
                        size: data.chosen.size,
                        quantity: data.chosen.quantity,
                        maxquantity: productStore.productdetail?.quantity,
                        price: productStore.productdetail?.price,
                        thumbnail: productStore.productdetail?.thumbnail,
                      })
                    "
                  >
                    <i class="bi bi-cart-plus"></i> Add to Cart
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { useRoute } from "vue-router";
import Navbar from "../layouts/Navbar.vue";
import { useProductStore } from "@/stores/useProductStore.js";
import { onMounted, reactive } from "vue";
import Spinner from "../layouts/Spinner.vue";
import { BASE_URL, makeUniqueId } from "@/helpers/config.js";
import { useCartStore } from "@/stores/useCartStore.js";

const term = useRoute().params.slug;
const productStore = useProductStore();
const cartStore = useCartStore();

const data = reactive({
  chosen: {
    color: null,
    size: null,
    quantity: 1,
  },
});

onMounted(() => {
  productStore.getAllProductsDetail(term);
});
</script>
<style scoped>
.border-dashed {
  border-style: dashed !important;
}
.cursor-pointer {
  cursor: pointer;
}
</style>