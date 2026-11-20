        <footer class="text-center">
            <div class="container">
                <span class="text-muted small">&copy; 2026 <strong>Admin Yönetim Sistemi</strong>. Tüm hakları saklıdır.</span>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            @session('success')
            <script>
                Swal.fire({
                    position: "top-end",
                    icon: "success",
                    title: "{{session('success')}}",
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
            @endsession
            @session('error')
            <script>
                Swal.fire({
                    position: "top-end",
                    icon: "error",
                    title: "{{ session('error') }}",
                    showConfirmButton: false,
                    timer: 2500
                });
            </script>
            @endsession
            <script>
                function deleteItem(id) {
                    Swal.fire({
                        title: "Are you sure?",
                        text: "You won't be able to revert this!",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Yes, delete it!"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById(id).submit();
                        }
                    });
                }
            </script>
            <script>
                document.getElementById('sidebarCollapse').addEventListener('click', function() {
                    document.getElementById('sidebar').classList.toggle('active');
                });
            </script>
        </footer>