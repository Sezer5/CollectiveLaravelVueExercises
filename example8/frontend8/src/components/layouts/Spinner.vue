<template>
  <transition name="fade">
    <div v-if="isLoading" class="spinner-overlay">
      <div class="content-wrapper">
        <!-- Dönen animasyon -->
        <div class="spinner-box">
          <div class="spinner-border text-primary" role="status"></div>
        </div>

        <!-- Şık bir mesaj -->
        <div class="loading-text mt-3">
          <span class="fw-bold">Vue T-shirt</span>
          <p class="small text-muted">Please Wait...</p>
        </div>
      </div>
    </div>
  </transition>
</template>

<script setup>
defineProps({
  isLoading: {
    type: Boolean,
    required: true,
  },
});
</script>

<style scoped>
.spinner-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(255, 255, 255, 0.192);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  backdrop-filter: blur(8px); /* Daha belirgin bir bulanıklık */
}

.content-wrapper {
  text-align: center;
}

.spinner-border {
  width: 3rem;
  height: 3rem;
  border-width: 0.25em;
}

/* Şık metin stili */
.loading-text span {
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #333;
}

/* Giriş/Çıkış animasyonu */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>