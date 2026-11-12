<template>
  <div
    class="bg-light w-100 vh-100 border border-2 d-flex justify-content-center"
  >
    <div class="col-md-4 my-5">
      <div class="card">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <Spinner :isLoading="authStore.isLoading" />
          <RenderValidationErrors
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
                placeholder="Please enter an e-mail"
                v-model="user.email"
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
                placeholder="Please enter a password"
                v-model="user.password"
              />
            </div>
            <div class="mb-3 text-end">
              <button
                class="btn btn-light btn-sm text-black border border-2 border-black"
                type="submit"
              >
                <i class="bi bi-person"></i> Sign in
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import RenderValidationErrors from "./layouts/RenderValidationErrors.vue";
import { useAuthStore } from "@/stores/useAuthStore";
import Spinner from "./layouts/Spinner.vue";
import axios from "axios";
import { BASE_URL } from "@/helpers/config.js";

const toast = useToast();
const router = useRouter();
const authStore = useAuthStore();

const user = reactive({
  email: "",
  password: "",
});

const loginUser = async () => {
  authStore.isLoading = true;
  try {
    const response = await axios.post(`${BASE_URL}/api/user/auth`, user);
    authStore.setUser(response.data.user);
    authStore.setAccessToken(response.data.access_token);
    authStore.setRoles(response.data.user.roles);
    authStore.setLoggedIn();
    router.push("/");
    toast.success(response.data.message, {
      timeout: 2000,
    });
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
    } else if (error.response.status === 401) {
      toast.warning(error.response.data.error, {
        timeout: 2000,
      });
    }
  } finally {
    // İstek başarılı da olsa hatalı da olsa isLoading her zaman false olur
    authStore.isLoading = false;
  }
};

onMounted(() => {
  authStore.clearValidationErrors();
});
</script>
<style scoped></style>