<nav id="sidebar">
    <div class="p-4">
        <h4 class="text-white fw-bold"><i class="bi bi-cpu-fill me-2"></i>AdminPanel</h4>
    </div>
    <ul class="nav flex-column">
        <li class="nav-item"><a href="{{ route('admin.index') }}"
                class="nav-link {{ Route::is('admin.index') ? 'active' : '' }}"><i class="bi bi-house me-2"></i> Home</a>
        </li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="bi bi-cart-check me-2"></i> Siparişler</a></li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="bi bi-people me-2"></i> Kullanıcılar</a></li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="bi bi-gear me-2"></i> Ayarlar</a></li>
    </ul>
</nav>
