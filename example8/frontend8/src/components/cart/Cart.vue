<template>
  <div class="col-md-12 bg-white mt-2">
    <div v-if="!cartStore.cartItems.length">
      <div class="alert alert-info">
        <i class="bi bi-exclamation-triangle"></i> Please add product to your
        cart
      </div>
    </div>
    <div v-else>
      <table class="table table-responsive table-bordered text-center">
        <thead>
          <tr>
            <th>*</th>
            <th>*</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Sub Total</th>
            <th>Color</th>
            <th>Size</th>
            <th @click="cartStore.deleteCart()" class="cpointer">*</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in cartStore.cartItems" :key="item.id">
            <td>{{ (index += 1) }}</td>
            <td><img :src="`${BASE_URL}/` + item.thumbnail" width="60" /></td>
            <td>
              <i
                class="bi bi-caret-up-fill cpointer"
                @click="
                  cartStore.incrementItem({
                    product_id: item.product_id,
                    color: item.color,
                    size: item.size,
                    Qty: item.Qty,
                    maxQty: item.maxQty,
                  })
                "
              ></i>
              {{ item.Qty }}
              <i
                class="bi bi-caret-down-fill cpointer"
                @click="
                  cartStore.decrementItem({
                    product_id: item.product_id,
                    color: item.color,
                    size: item.size,
                    Qty: item.Qty,
                    maxQty: item.maxQty,
                  })
                "
              ></i>
            </td>
            <td>$ {{ item.price }}</td>
            <td>$ {{ item.price * item.Qty }}</td>
            <td>{{ item.color }}</td>
            <td>{{ item.size }}</td>
            <td>
              <i
                class="bi bi-trash cpointer"
                @click="
                  cartStore.deleteItem({
                    product_id: item.product_id,
                    color: item.color,
                    size: item.size,
                  })
                "
              ></i>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";
import { useCartStore } from "@/stores/useCartStore";

const cartStore = useCartStore();
</script>

<style scoped>
.cpointer {
  cursor: pointer;
}
</style>