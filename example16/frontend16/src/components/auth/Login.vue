<template>
  <div>
    <Navbar />
    <Spinner :isLoading="authStore.isLoading" />
    <div class="col-md-12 d-flex justify-content-center">
      <div class="card col-md-3 mt-2">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <RenderValidationErrors
            :validationErrors="authStore.validationErrors"
          />
          <form @submit.prevent="loginUser()" method="post">
            <div class="mb-3">
              <label for="" class="form-label">Email</label>
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
                aria-describedby="helpId"
                placeholder="Please enter an e-mail*"
                v-model="data.user.email"
              />
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Password</label>
              <input
                type="password"
                class="form-control"
                name="password"
                id="password"
                aria-describedby="helpId"
                placeholder="Please enter a password*"
                v-model="data.user.password"
              />
            </div>
            <div class="mb-3 text-end">
              <button class="btn btn-dark btn-sm">
                <i class="bi bi-box-arrow-in-left"></i> Login
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { useRouter } from "vue-router";
import Navbar from "../layouts/Navbar.vue";
import Spinner from "../layouts/Spinner.vue";
import { useAuthStore } from "@/stores/useAuthStore.js";
import RenderValidationErrors from "../layouts/RenderValidationErrors.vue";
import axios from "axios";
import { BASE_URL } from "@/helpers/config.js";
import { useToast } from "vue-toastification";
import { onMounted, reactive } from "vue";

const router = useRouter();
const authStore = useAuthStore();
const toast = useToast();

const data = reactive({
  user: {
    email: "",
    password: "",
  },
});

const loginUser = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.post(`${BASE_URL}/api/user/auth`, data.user);
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setLoggedIn();
    authStore.setRoles(response.data.user.roles);
    router.push("/");
    toast.success(response.data.message, {
      timeout: 2000,
    });
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
    }

    if (error.response.status === 401) {
      toast.warning(error.response.data.message, {
        timeout: 2000,
      });
    }
  } finally {
    authStore.isLoading = false;
  }
};

onMounted(() => {
  authStore.clearValidationError();
});
</script>
<style scoped>
</style>