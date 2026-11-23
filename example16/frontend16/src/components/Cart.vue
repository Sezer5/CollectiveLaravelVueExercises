<template>
  <div>
    <Navbar />
    <div class="col-md-12 d-flex flex-wrap">
      <div
        class="alert alert-info w-100 text-center"
        v-if="!cartStore.cartItems?.length"
      >
        <h3>
          <i class="bi bi-exclamation-triangle-fill"></i> Please add an item in
          your cart!
        </h3>
      </div>
      <div class="card p-3 w-100" v-else>
        <table class="table table-responsive table-bordered text-center">
          <thead>
            <tr>
              <th>*</th>
              <th>*</th>
              <th>Name</th>
              <th>Quantity</th>
              <th>Color</th>
              <th>Size</th>
              <th>Price</th>
              <th>Subtotal</th>
              <th>
                <i
                  class="bi bi-trash cursor-pointer text-danger"
                  @click="cartStore.deleteCart()"
                ></i>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in cartStore.cartItems" :key="index">
              <td>{{ ++index }}</td>
              <td>
                <img :src="`${BASE_URL}/` + item.thumbnail" width="60" />
              </td>
              <td>{{ item.name }}</td>
              <td>
                <i
                  class="bi bi-caret-up-fill cursor-pointer"
                  @click="
                    cartStore.increaseItem({
                      color: item.color,
                      size: item.size,
                      product_id: item.product_id,
                      name: item.name,
                    })
                  "
                ></i>
                {{ item.quantity }}
                <i
                  class="bi bi-caret-down-fill cursor-pointer"
                  @click="
                    cartStore.decreaseItem({
                      color: item.color,
                      size: item.size,
                      product_id: item.product_id,
                      name: item.name,
                      unique_id: item.unique_id,
                    })
                  "
                ></i>
              </td>
              <td>{{ item.color }}</td>
              <td>{{ item.size }}</td>
              <td>{{ item.price }}</td>
              <td>{{ item.price * item.quantity }}</td>
              <td>
                <i
                  class="bi bi-trash cursor-pointer"
                  @click="
                    cartStore.deleteItem({
                      color: item.color,
                      size: item.size,
                      product_id: item.product_id,
                      name: item.name,
                      unique_id: item.unique_id,
                    })
                  "
                ></i>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script setup>
import Navbar from "../components/layouts/Navbar.vue";
import { useProductStore } from "@/stores/useProductStore.js";
import { useCartStore } from "@/stores/useCartStore.js";
import { BASE_URL } from "@/helpers/config.js";

const productStore = useProductStore();
const cartStore = useCartStore();
</script>
<style scoped>
.border-dashed {
  border-style: dashed !important;
}
.cursor-pointer {
  cursor: pointer;
}
</style>