<template>
  <div
    class="col-md-12 bg-light vh-100 elementim d-flex justify-content-center"
  >
    <div class="col-md-4 mt-5">
      <div class="card">
        <div class="card-header">
          <h3>Login</h3>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label for="" class="form-label">E-mail</label>
            <input
              type="email"
              class="form-control"
              name="email"
              id="email"
              aria-describedby="helpId"
              placeholder="Please enter an e-mail*"
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
            />
          </div>
          <div class="mb-3">
            <button class="btn btn-dark">
              <i class="bi bi-box-arrow-right"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
.elementim {
  box-sizing: border-box;
}
</style>