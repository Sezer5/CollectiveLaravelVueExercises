<template>
  <div class="col-md-12 d-flex justify-content-between">
    <Sidebar />
    <div class="card w-100 p-3">
      <Header />
      <ProfileHeader />
      <ProfileBody />
    </div>
  </div>
</template>

<script setup>
import Header from "./Header.vue";
import ProfileBody from "./ProfileBody.vue";
import ProfileHeader from "./ProfileHeader.vue";
import Sidebar from "./Sidebar.vue";
</script>

<style scoped></style>