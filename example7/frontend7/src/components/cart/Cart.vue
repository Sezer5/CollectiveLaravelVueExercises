<template>
  <div class="col-md-12">
    <div
      class="col-md-12 alert alert-info mt-2 text-center"
      v-if="cartStore.cartItems.length === 0"
    >
      <h3><i class="bi bi-exclamation-triangle-fill"></i> Cart is empty!</h3>
    </div>
    <div class="col-md-12 card" v-else>
      <div class="card-header text-center my-2">
        <h3>Cart</h3>
      </div>
      <div class="card-body">
        <table class="table table-responsive table-bordered">
          <thead>
            <tr>
              <th>*</th>
              <th>*</th>
              <th>Color</th>
              <th>Size</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>SubTotal</th>
              <th>
                <button
                  class="btn-danger btn btn-sm"
                  @click="cartStore.emptyToYourCart()"
                >
                  <i class="bi bi-trash text-white"></i>
                </button>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(item, index) in cartStore.cartItems"
              :key="item.product_id"
            >
              <td>{{ (index += 1) }}</td>
              <td>
                <img :src="`${BASE_URL}/api/` + item.thumbnail" width="60" />
              </td>
              <td>{{ item.color }}</td>
              <td>{{ item.size }}</td>
              <td>${{ item.price }}</td>
              <td>
                <i
                  class="bi bi-caret-up-fill"
                  style="cursor: pointer"
                  @click="
                    cartStore.incrementItem({
                      product_id: item.product_id,
                      size: item.size,
                      color: item.color,
                      maxQty: item.maxQty,
                      Qty: item.Qty,
                      ref: item.ref,
                    })
                  "
                ></i>
                {{ item.Qty }}
                <i
                  class="bi bi-caret-down-fill"
                  style="cursor: pointer"
                  @click="
                    cartStore.decrementItem({
                      product_id: item.product_id,
                      size: item.size,
                      color: item.color,
                      maxQty: item.maxQty,
                      Qty: item.Qty,
                      ref: item.ref,
                    })
                  "
                ></i>
              </td>
              <td>${{ item.Qty * item.price }}</td>
              <td>
                <button
                  class="btn-dark btn btn-sm"
                  @click="
                    cartStore.deleteItemToCart({
                      ref: item.ref,
                    })
                  "
                >
                  <i class="bi bi-trash text-white"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script setup>
import { useCartStore } from "@/stores/useCartStore";

const cartStore = useCartStore();
</script>
<style scoped></style>