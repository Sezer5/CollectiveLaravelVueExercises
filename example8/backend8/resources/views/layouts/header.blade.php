
        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-light d-md-none">
                    <i class="bi bi-list"></i>
                </button>

                <div class="ms-auto d-flex align-items-center">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle" id="userMenu" data-bs-toggle="dropdown">
                            <img src="https://ui-avatars.com/api/?name=Admin&background=40b27f&color=fff" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                            <span class="d-none d-sm-inline text-muted">Hoş geldin, <strong>Yönetici</strong></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                            <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Profil</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item text-danger" href="{{route('admin.logout')}}"><i class="bi bi-box-arrow-right me-2"></i>Çıkış Yap</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
