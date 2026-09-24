<template>
  <div class="bg-light col-md-12 vh-100">
    <div class="d-flex justify-content-center">
      <div class="card col-md-4 mt-5">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <RenderValidationErrors
            :validationErrors="authStore.validationErrors"
          />
          <form @submit="loginAdmin()">
            <div class="mb-3">
              <label for="email" class="form-label">E-mail*</label>
              <input
                type="email"
                class="form-control"
                placeholder="Please enter an e-mail*"
                v-model="data.user.email"
              />
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password*</label>
              <input
                type="password"
                class="form-control"
                placeholder="Please enter a password*"
                v-model="data.user.password"
              />
            </div>
            <div class="mb-3">
              <button class="btn btn-dark" type="submit">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helper/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import RenderValidationErrors from "../regularfiles/RenderValidationErrors.vue";

const data = reactive({
  user: {
    email: "",
    password: "",
  },
});

const authStore = useAuthStore();

const router = useRouter();
const toast = useToast();

const loginAdmin = async () => {
  try {
    const response = await axios.post(`${BASE_URL}/api/auth`, data.user);
    authStore.setUser(response.data.user);
    authStore.setToken(response.data.access_token);
    authStore.setIsLoggedIn();
    toast.success(response.data.message, {
      timeout: 2000,
    });
    router.push("/admin/home");
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
    }
  }
};

onMounted(() => {
  authStore.clearValidationErrors();
});
</script>

<style scoped>
</style>