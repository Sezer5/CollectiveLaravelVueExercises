<template>
  <div class="col-md-12 d-flex justify-content-center">
    <Spinner :isLoading="adminAuth.isLoading" />
    <div class="card col-md-4 mt-4">
      <div class="card-header">
        <h3>Login</h3>
      </div>
      <div class="card-body">
        <form @submit.prevent="authAdmin()" method="POST">
          <RenderValidationErrors
            :validationErrors="adminAuth.validationErrors"
          />
          <div class="mb-3">
            <label for="" class="form-label">E-mail</label>
            <input
              type="email"
              class="form-control"
              name="email"
              id="email"
              aria-describedby="helpId"
              placeholder="Please enter an email*"
              v-model="data.admin.email"
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
              v-model="data.admin.password"
            />
          </div>
          <div class="mb-3 text-end">
            <button class="btn btn-dark btn-sm">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useAdminAuthStore } from "@/stores/useAdminAuthStore";
import { onMounted, reactive } from "vue";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import Spinner from "../Spinner.vue";
import axios from "axios";
import { BASE_URL } from "@/helpers/config.js";
import RenderValidationErrors from "../RenderValidationErrors.vue";

const router = useRouter();
const toast = useToast();
const adminAuth = useAdminAuthStore();
const data = reactive({
  admin: {
    email: "",
    password: "",
  },
});

const authAdmin = async () => {
  adminAuth.isLoading = true;
  try {
    adminAuth.isLoading = false;
    const response = await axios.post(`${BASE_URL}/api/admin/auth`, data.admin);
    adminAuth.setAdmin(response.data.user);
    adminAuth.setAdminAccessToken(response.data.token);
    adminAuth.setIsloggedIn();
    adminAuth.isLoading = false;
    toast.success(response.data.message, {
      timeout: 2000,
    });

    router.push("/admin/home");
  } catch (error) {
    if (error.response.status === 422) {
      adminAuth.setValidationErrors(error.response.data.errors);
      adminAuth.isLoading = false;
    }
    if (error.response.status === 401) {
      toast.warning(error.response.data.error, {
        timeout: 2000,
      });
      adminAuth.isLoading = false;
    }
  }
};

onMounted(() => {
  adminAuth.clearValidationErrors();
});
</script>

<style scoped>
</style>