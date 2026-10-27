<template>
  <div class="col-md-12 d-flex justify-content-between">
    <div
      class="col-md-12 d-flex justify-content-center alert alert-primary mt-2"
      v-if="!cartStore.cartItems"
    >
      <h3>
        <i class="bi bi-exclamation-triangle-fill"></i> Your cart is empty
        please add item to your cart
      </h3>
    </div>
    <div class="col-md-12 d-flex justify-content-center bg-white mt-2" v-else>
      <table class="table-responsive table table-bordered">
        <thead>
          <tr class="text-center">
            <th>*</th>
            <th>*</th>
            <th>Color</th>
            <th>Size</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>SubTotal</th>
            <th>
              <i
                class="bi bi-trash text-danger cursorPointer"
                @click="cartStore.deleteToCart()"
              ></i>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(item, index) in cartStore.cartItems"
            :key="index"
            class="text-center"
          >
            <td>{{ index }}</td>
            <td>
              <img :src="`${BASE_URL}/` + item.thumbnail" width="30" />
            </td>
            <td>{{ item.color }}</td>
            <td>{{ item.size }}</td>
            <td>$ {{ item.price }}</td>
            <td>
              <i
                class="bi bi-caret-up cursorPointer"
                @click="
                  cartStore.increaseItemQty({
                    ref: item.ref,
                    color: item.color,
                    size: item.size,
                    qty: item.qty,
                    maxQTY: item.maxQTY,
                    product_id: item.product_id,
                    thumbnail: item.thumbnail,
                    price: item.price,
                  })
                "
              ></i>
              {{ item.qty }}
              <i
                class="bi bi-caret-down cursorPointer"
                @click="
                  cartStore.decreaseItemQty({
                    ref: item.ref,
                    color: item.color,
                    size: item.size,
                    qty: item.qty,
                    maxQTY: item.maxQTY,
                    product_id: item.product_id,
                    thumbnail: item.thumbnail,
                    price: item.price,
                  })
                "
              ></i>
            </td>
            <td>$ {{ item.qty * item.price }}</td>
            <td>
              <i
                class="bi bi-trash cursorPointer"
                @click="
                  cartStore.deleteItemToCart({
                    ref: item.ref,
                    color: item.color,
                    size: item.size,
                    qty: item.qty,
                    maxQTY: item.maxQTY,
                    product_id: item.product_id,
                    thumbnail: item.thumbnail,
                    price: item.price,
                  })
                "
              ></i>
            </td>
          </tr>
          <tr>
            <th colspan="2"><h4>Total:</h4></th>
            <th colspan="6" class="text-end">
              <h4>$ {{ total }}</h4>
            </th>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";
import { useCartStore } from "@/stores/useCartStore";
import { computed } from "vue"; // computed'ı içe aktarıyoruz

const cartStore = useCartStore();

// Toplam fiyatı otomatik hesaplayan reaktif yapı
const total = computed(() => {
  // Eğer sepet boş veya henüz yüklenmediyse 0 döndür
  if (!cartStore.cartItems || cartStore.cartItems.length === 0) return 0;

  // reduce yöntemiyle sepetin toplamını tertemiz hesaplıyoruz
  return cartStore.cartItems.reduce((sum, item) => {
    return sum + item.qty * item.price;
  }, 0);
});
</script>

<style scoped>
.cursorPointer {
  cursor: pointer;
}
</style>