<template>
  <div class="col-md-12 d-flex justify-content-center align-items-center">
    <div class="card col-md-3 mt-5">
      <div class="card-header">
        <h3>Login</h3>
      </div>
      <div class="card-body">
        <form @submit.prevent="loginUser()">
          <RenderValidationError
            :validationErrors="authStore.validationErrors"
          />
          <div class="mb-3">
            <label for="" class="form-label">Email</label>
            <input
              type="email"
              class="form-control"
              name="email"
              id="email"
              aria-describedby="helpId"
              placeholder="Please enter an email"
              v-model="data.user.email"
            />
          </div>
          <div class="mb-3">
            <label for="" class="form-label">password</label>
            <input
              type="password"
              class="form-control"
              name="password"
              id="password"
              aria-describedby="helpId"
              placeholder="Please enter a password"
              v-model="data.user.password"
            />
          </div>
          <div class="mb-3 text-end">
            <button class="btn btn-success btn-sm">
              <i class="bi bi-box-arrow-right"></i> Login
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import RenderValidationError from "./layouts/RenderValidationError.vue";

const router = useRouter();
const toast = useToast();
const authStore = useAuthStore();

const data = reactive({
  user: {
    email: "",
    password: "",
  },
});

const loginUser = async () => {
  try {
    const response = await axios.post(`${BASE_URL}/api/user/auth`, data.user);
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setLoggedIn();
    toast.success(response.data.message, {
      timeout: 2000,
    });
    router.push("/");
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

<style scoped></style>