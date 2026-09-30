<template>
  <div class="col-md-12 d-flex justify-content-center">
    <div class="col-md-4 mt-3">
      <div class="card">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <RenverValidationErrors
            :validationErrors="authStore.validationErrors"
          />
          <form @submit.prevent="loginUser()">
            <div class="mb-3">
              <label for="" class="form-label">E-mail</label>
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
                aria-describedby="helpId"
                placeholder="Please enter an email*"
                v-model="data.user.email"
              />
            </div>
            <div class="mb-3">
              <label for="" class="form-label">Password</label>
              <input
                type="text"
                class="form-control"
                name="password"
                id="password"
                aria-describedby="helpId"
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
import { BASE_URL } from "@/helpers/config";
import { useAuthStore } from "@/stores/useAuthStore";
import axios from "axios";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import RenverValidationErrors from "./layouts/RenverValidationErrors.vue";

const data = reactive({
  user: {
    email: "",
    password: "",
  },
});

const toast = useToast();
const router = useRouter();
const authStore = useAuthStore();

const loginUser = async () => {
  try {
    const response = await axios.post(`${BASE_URL}/api/user/login`, data.user);
    authStore.setUser(response.data.user);
    authStore.setToken(response.data.access_token);
    authStore.setLoggedIn();
    toast.success(`${response.data.message}`, {
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

<style scoped>
</style>