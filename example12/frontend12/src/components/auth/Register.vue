<template>
  <div class="col-md-12 d-flex justify-content-center">
    <div class="card mt-4 col-md-4">
      <div class="card-header">
        <h3>Register</h3>
      </div>
      <div class="card-body">
        <RenderValidationErrors />
        <form @submit.prevent="registerUser()" method="POST">
          <div class="mb-3">
            <label for="" class="form-label">Name</label>
            <input
              type="text"
              class="form-control"
              name="name"
              id="name"
              aria-describedby="helpId"
              placeholder="Please enter a name*"
              v-model="data.name"
            />
          </div>
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

const registerUser = async () => {
  try {
    const response = await axios.post(`${BASE_URL}/api/user/register`, data);
    toast.success("User created successfully", {
      timeout: 2000,
    });
    data.name = "";
    data.email = "";
    data.password = "";
    router.push("/login");
  } catch (error) {
    if (error.response.status === 422) {
      authStore.setValidationErrors(error.response.data.errors);
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