<template>
  <div class="col-md-12 d-flex justify-content-center">
    <div class="card mt-4 col-md-4">
      <div class="card-header">
        <h3>Login</h3>
      </div>
      <div class="card-body">
        <RenderValidationErrors />
        <form @submit.prevent="loginUser()" method="POST">
          <div class="mb-3">
            <label for="" class="form-label">Email</label>
            <input
              type="email"
              class="form-control"
              name="email"
              id="email"
              aria-describedby="helpId"
              placeholder="Please enter an email*"
              v-model="data.email"
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
              v-model="data.password"
            />
          </div>
          <div class="mb-3 text-end">
            <button class="btn btn-secondary" type="submit">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BASE_URL } from "@/helpers/config";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import RenderValidationErrors from "../layouts/RenderValidationErrors.vue";
import { useAuthStore } from "@/stores/useAuthStore";

const toast = useToast();
const router = useRouter();
const authStore = useAuthStore();

const data = reactive({
  name: "",
  email: "",
  password: "",
});

const loginUser = async () => {
  try {
    const response = await axios.post(`${BASE_URL}/api/user/auth`, data);
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setLoggedIn();
    router.push("/");
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
      console.log(error);
    } else if (error.response.status === 401) {
      toast.warning(error.response.data.error, {
        timeout: 2000,
      });
      console.log(error);
    }
  }
};

onMounted(() => {
  authStore.clearValidationErrors();
});
</script>

<style scoped>
</style>