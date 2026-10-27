<template>
  <div class="col-md-12 d-flex justify-content-center">
    <div class="card mt-4 col-md-4">
      <div class="card-header">
        <h3>Register</h3>
      </div>
      <div class="card-body">
        <form method="post">
          <div class="mb-3">
            <label for="" class="form-label">Name</label>
            <input
              type="text"
              class="form-control"
              name="name"
              id="name"
              aria-describedby="helpId"
              placeholder="Please enter a name*"
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
          <div class="mb-3 text-end">
            <button class="btn btn-secondary">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
</style>