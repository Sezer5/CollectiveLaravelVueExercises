<template>
  <div class="col-md-12 mt-2 d-flex justify-content-center">
    <Spinner :isLoading="authStore.isLoading" />
    <div class="card col-md-4">
      <div class="card-header text-center">
        <h3>Login</h3>
      </div>
      <div class="card-body">
        <RenderValidationErrors
          :validationErrors="authStore.validationErrors"
        />
        <form @submit.prevent="loginUser">
          <div class="mb-3">
            <label for="" class="form-label">E-mail</label>
            <input
              type="email"
              class="form-control"
              name="email"
              placeholder="Please enter email*"
              v-model="data.user.email"
            />
          </div>
          <div class="mb-3">
            <label for="" class="form-label">Password</label>
            <input
              type="password"
              class="form-control"
              name="password"
              placeholder="Please enter password*"
              v-model="data.user.password"
            />
          </div>
          <div class="mb-3 text-end">
            <button class="btn btn-dark">Submit</button>
          </div>
        </form>
      </div>
      <div class="card-footer text-center"><hr /></div>
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
import RenderValidationErrors from "../layouts/RenderValidationErrors.vue";
import Spinner from "../layouts/Spinner.vue";

const data = reactive({
  user: {
    email: "",
    password: "",
  },
});

const authStore = useAuthStore();

const toast = useToast();

const router = useRouter();

const loginUser = async () => {
  authStore.isLoading = true;
  try {
    authStore.isLoading = false;
    const response = await axios.post(`${BASE_URL}/api/user/login`, data.user);
    toast.success(response.data.message, {
      timeout: 2000,
    });
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.isLoggedIn = true;
    router.push("/");
  } catch (error) {
    authStore.isLoading = false;
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