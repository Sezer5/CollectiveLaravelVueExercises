<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
      <!-- Logo / Marka -->
      <router-link class="navbar-brand fw-bold" to="/">AppPortal</router-link>

      <!-- Mobil Menü Butonu -->
      <button
        class="navbar-toggler border-0"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Menü Öğeleri -->
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link" to="/dashboard"
              >Ana Sayfa</router-link
            >
          </li>

          <!-- Açılır Menü (Dropdown) -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              İşlemler
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link class="dropdown-item" to="/requests"
                  >Talep Listesi</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/requests/new"
                  >Yeni Talep</router-link
                >
              </li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <router-link class="dropdown-item" to="/invoices"
                  >Faturalar</router-link
                >
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/reports">Raporlar</router-link>
          </li>
        </ul>

        <!-- Sağ Taraf: Profil / Kullanıcı -->
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle d-flex align-items-center gap-2"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="bi bi-person-circle fs-5"></i>
              <span>Hesabım</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <router-link class="dropdown-item" to="/profile"
                  >Profil Bilgileri</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/settings"
                  >Ayarlar</router-link
                >
              </li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <button class="dropdown-item text-danger" @click="logout">
                  Çıkış Yap
                </button>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
// Çıkış fonksiyonu örneği
const logout = () => {
  console.log("Çıkış yapıldı...");
  // Buraya pinia store logout veya yönlendirme eklenebilir
};
</script>