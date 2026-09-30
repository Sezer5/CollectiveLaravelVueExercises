<template>
  <div class="container py-4">
    <!-- Yükleniyor Durumu (Loading Skeleton) -->
    <div v-if="productStore.isLoading" class="text-center py-5">
      <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Yükleniyor...</span>
      </div>
    </div>

    <!-- Ürün Detay Yapısı -->
    <div v-else-if="product" class="row g-4">
      <!-- SOL TARAF: Görsel ve Galeri -->
      <div class="col-lg-6">
        <div class="card border-0 shadow-sm overflow-hidden mb-3">
          <img
            :src="`${BASE_URL}/${product.thumbnail}`"
            class="img-fluid w-100 object-fit-cover"
            style="max-height: 480px"
            :alt="product.name"
          />
        </div>
      </div>

      <!-- SAĞ TARAF: Ürün Bilgileri ve Satın Alma -->
      <div class="col-lg-6">
        <div class="ps-lg-3">
          <!-- Başlık -->
          <h2 class="fw-bold mb-2">{{ product.name }}</h2>

          <!-- Değerlendirme & Stok Durumu -->
          <div class="d-flex align-items-center gap-3 mb-3">
            <div class="text-warning">
              <i class="bi bi-star-fill"></i>
              <i class="bi bi-star-fill"></i>
              <i class="bi bi-star-fill"></i>
              <i class="bi bi-star-fill"></i>
              <i class="bi bi-star-half"></i>
              <span class="text-muted small ms-1"
                >(4.5 / 50 Değerlendirme)</span
              >
            </div>
            <span class="text-muted">|</span>
            <span
              class="badge"
              :class="
                product.quantity > 0
                  ? 'bg-success-subtle text-success border border-success-subtle'
                  : 'bg-danger-subtle text-danger border border-danger-subtle'
              "
            >
              {{
                product.quantity > 0
                  ? `In Stock (${product.quantity} Piece)`
                  : "Out Of Stock"
              }}
            </span>
          </div>

          <!-- Fiyat -->
          <div class="mb-4">
            <span class="display-6 fw-bold text-primary"
              >₺{{ product.price }}</span
            >
          </div>

          <!-- Kısa Açıklama -->
          <p class="text-muted mb-4" v-if="product.description">
            {{ product.description.substring(0, 150) }}...
          </p>

          <hr class="my-4" />

          <!-- RENK SEÇENEKLERİ -->
          <div v-if="product.colors && product.colors.length" class="mb-4">
            <label class="form-label fw-semibold d-block mb-2">Colors:</label>
            <div class="d-flex gap-2 align-items-center">
              <span
                v-for="color in product.colors"
                :key="color.id || color.name"
                class="color-badge border"
                :style="{
                  backgroundColor: color.code || color.name,
                  display: 'flex',
                  justifyContent: 'center',
                  alignItems: 'center',
                  cursor: 'pointer',
                }"
                :title="color.name"
                @click="data.chosenColor = color.name"
              >
                <i
                  class="bi bi-check-lg text-white"
                  v-if="data.chosenColor === color.name"
                ></i>
              </span>
            </div>
          </div>

          <!-- BEDEN SEÇENEKLERİ -->
          <div v-if="product.sizes && product.sizes.length" class="mb-4">
            <label class="form-label fw-semibold d-block mb-2">Sizes:</label>
            <div class="d-flex gap-2 flex-wrap">
              <span
                v-for="size in product.sizes"
                :key="size.id || size.name"
                :class="
                  data.chosenSize === size.name
                    ? 'badge bg-dark text-white border px-3 py-2 fs-6 fw-normal'
                    : 'badge bg-light text-dark border px-3 py-2 fs-6 fw-normal'
                "
                style="cursor: pointer"
                @click="data.chosenSize = size.name"
              >
                {{ size.name }}
              </span>
            </div>
          </div>

          <!-- ADET VE SEPETE EKLE -->
          <div class="row g-3 align-items-center mt-2">
            <div class="col-auto">
              <div class="input-group" style="width: 130px">
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  @click="data.chosenQty > 1 && data.chosenQty--"
                >
                  <i class="bi bi-dash"></i>
                </button>
                <input
                  type="text"
                  class="form-control text-center"
                  v-model="data.chosenQty"
                  readonly
                />
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  @click="data.chosenQty < product.quantity && data.chosenQty++"
                >
                  <i class="bi bi-plus"></i>
                </button>
              </div>
            </div>

            <div class="col">
              <button
                class="btn btn-primary btn-lg w-100"
                :disabled="
                  product.quantity <= 0 || !data.chosenColor || !data.chosenSize
                "
                @click="
                  cartStore.addItemToCart({
                    product_id: product.id,
                    uniqueId: makeUniqueId(10),
                    color: data.chosenColor,
                    size: data.chosenSize,
                    Qty: data.chosenQty,
                    price: product.price,
                    maxQty: product.quantity,
                    thumbnail: product.thumbnail,
                  })
                "
              >
                <i class="bi bi-cart-plus me-2"></i> Add to Cart
              </button>
            </div>

            <div class="col-auto">
              <button class="btn btn-outline-secondary btn-lg">
                <i class="bi bi-heart"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- ALT TARAF: Ürün Detaylı Açıklaması & Bilgiler -->
      <div class="col-12 mt-5">
        <div class="card border-0 shadow-sm">
          <div class="card-body p-4">
            <ul class="nav nav-tabs mb-3" id="productTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button
                  class="nav-link active fw-semibold"
                  id="desc-tab"
                  data-bs-toggle="tab"
                  data-bs-target="#desc-tab-pane"
                  type="button"
                >
                  Description
                </button>
              </li>
            </ul>
            <div class="tab-content" id="productTabContent">
              <div
                class="tab-pane fade show active text-muted lh-lg"
                id="desc-tab-pane"
              >
                {{ product.description }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Ürün Bulunamadı Durumu -->
    <div v-else class="text-center py-5">
      <i class="bi bi-exclamation-triangle display-1 text-warning"></i>
      <h3 class="mt-3">Ürün Bulunamadı</h3>
      <router-link to="/products" class="btn btn-primary mt-2">
        Ürünlere Geri Dön
      </router-link>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, reactive } from "vue";
import { useRoute } from "vue-router";
import { useProductStore } from "@/stores/useProductStore";
import { BASE_URL, makeUniqueId } from "@/helpers/config";
import { useCartStore } from "@/stores/useCartStore";

const route = useRoute();
const term = route.params.slug;

const productStore = useProductStore();
const cartStore = useCartStore();

const data = reactive({
  chosenColor: null,
  chosenSize: null,
  chosenQty: 1,
});

// Store üzerindeki detay nesnesini computed olarak alıyoruz
const product = computed(() => productStore.productDetails);

onMounted(() => {
  productStore.fetchProductsDetail(term);
});
</script>

<style scoped>
/* Renk baloncukları stili */
.color-badge {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  display: inline-block;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.object-fit-cover {
  object-fit: cover;
}
</style>