<template>
  <div
    class="flex-shrink-0 p-3 bg-white shadow-sm border border-3 vh-50"
    style="width: 380px"
  >
    <a
      href="/"
      class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom"
    >
      <svg class="bi me-2" width="30" height="24">
        <use xlink:href="#bootstrap"></use>
      </svg>
      <span class="fs-5 fw-semibold">{{ authStore.user?.name }}</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1 text-center">
        <img
          :src="`${BASE_URL}/` + authStore.user?.profile_image"
          :alt="authStore.user?.name"
          width="160"
          height="160"
          class="rounded rounded-circle"
        />
      </li>
      <li class="mb-1 text-center">
        <div>
          <form>
            <div class="input-group my-3">
              <input
                type="file"
                class="form-control"
                placeholder="Recipient's username"
                aria-label="Recipient's username"
                aria-describedby="button-addon2"
                :key="data.fileInputKey"
                @change="handleFileInputChange"
              />
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
                @click="updateUserProfileImage"
              >
                Button
              </button>
            </div>
          </form>
        </div>
      </li>
      <li class="mb-1">
        <i class="bi bi-person"></i> {{ authStore.user?.name }}
      </li>
      <li class="mb-1">
        <i class="bi bi-envelope"></i> {{ authStore.user?.email }}
      </li>
      <li class="mb-1"><i class="bi bi-cart"></i> Orders</li>
      <li class="mb-1"><i class="bi bi-pencil"></i> Reviews</li>
      <li class="mb-1"><i class="bi bi-envelope"></i> Messages</li>
    </ul>
  </div>
</template>

<script setup>
import { BASE_URL, headersConfig } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useToast } from "vue-toastification";

const authStore = useAuthStore();

const data = reactive({
  image: null,
  fileInputKey: 0,
});

//add the function to handle the file input change
const handleFileInputChange = (event) => {
  data.image = event.target.files[0];
};

const toast = useToast();

const updateUserProfileImage = async () => {
  authStore.clearValidationErrors();
  authStore.isLoading = true;

  const formData = new FormData();
  formData.append("profile_image", data.image);
  formData.append("_method", "PUT");

  try {
    const response = await axios.post(
      `${BASE_URL}/api/user/profile/update`,
      formData,
      headersConfig(authStore.access_token, "multipart/form-data")
    );
    authStore.user = response.data.user;
    authStore.isLoading = false;
    toast.success("Profile image updated succcessfully", {
      timeout: 2000,
    });
    clearInputFile();
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
      console.log(error);
    }
    authStore.isLoading = false;
  }
};

const clearInputFile = () => {
  data.fileInputKey++;
  data.image = null;
};

//once the component is loaded we clear the validation errors
onMounted(() => authStore.clearValidationErrors());
</script>

<style scoped>
body {
  min-height: 100vh;
  min-height: -webkit-fill-available;
}

html {
  height: -webkit-fill-available;
}

main {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  max-height: 100vh;
  overflow-x: auto;
  overflow-y: hidden;
}

.b-example-divider {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.1);
  border: solid rgba(0, 0, 0, 0.15);
  border-width: 1px 0;
  box-shadow: inset 0 0.5em 1.5em rgba(0, 0, 0, 0.1),
    inset 0 0.125em 0.5em rgba(0, 0, 0, 0.15);
}

.bi {
  vertical-align: -0.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle {
  outline: 0;
}

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: 0.25rem 0.5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, 0.65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, 0.85);
  background-color: #d2f4ea;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform 0.35s ease;
  transform-origin: 0.5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, 0.85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: 0.1875rem 0.5rem;
  margin-top: 0.125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #d2f4ea;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold {
  font-weight: 600;
}
.lh-tight {
  line-height: 1.25;
}
</style>