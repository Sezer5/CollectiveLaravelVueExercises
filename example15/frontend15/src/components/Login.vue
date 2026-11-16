<template>
  <div
    class="col-md-12 bg-light vh-100 elementim d-flex justify-content-center"
  >
    <Spinner :isLoading="authStore.isLoading" />
    <div class="col-md-2 mt-5">
      <div class="card">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <form @submit.prevent="auth()" method="POST">
            <RenderValidationError
              :validationErrors="authStore.validationErrors"
            />
            <div class="mb-3">
              <label for="" class="form-label">E-mail</label>
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
                aria-describedby="helpId"
                placeholder="Please enter an e-mail*"
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
              <button class="btn btn-dark" type="submit">
                <i class="bi bi-box-arrow-in-right"></i> Sign In
              </button>
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
import RenderValidationError from "./layouts/RenderValidationError.vue";
import Spinner from "./layouts/Spinner.vue";

const toast = useToast();
const router = useRouter();
const authStore = useAuthStore();

const data = reactive({
  email: "",
  password: "",
});

const auth = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.post(`${BASE_URL}/api/user/auth`, data);
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setRoles(response.data.user.roles);
    authStore.setIsLoggedIn();
    router.push("/");
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
    } else if (error.response.status === 401) {
      toast.warning(error.response.data.error, {
        timeout: 2000,
      });
    }
  } finally {
    authStore.isLoading = false;
  }
};

onMounted(() => {
  authStore.clearValidationErrors();
});
</script>

<style scoped>
.elementim {
  box-sizing: border-box;
}
</style>