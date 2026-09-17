<nav id="sidebar">
    <div class="p-4">
        <h4 class="text-white fw-bold"><i class="bi bi-cpu-fill me-2"></i>AdminPanel</h4>
    </div>
    <ul class="nav flex-column">
        <li class="nav-item"><a href="{{ route('admin.index') }}"
                class="nav-link {{ Route::is('admin.index') ? 'active' : '' }}"><i class="bi bi-house me-2"></i>
                Home</a></li>
        <li class="nav-item"><a href="{{ route('admin.category.index') }}"
                class="nav-link {{ Route::is('admin.category.*') ? 'active' : '' }}"><i class="bi bi-tag me-2"></i>
                Categories</a></li>
        <li class="nav-item"><a href="{{ route('admin.color.index') }}"
                class="nav-link {{ Route::is('admin.color.*') ? 'active' : '' }}"><i class="bi bi-palette me-2"></i>
                Colors</a></li>
        <li class="nav-item"><a href="{{ route('admin.size.index') }}"
                class="nav-link {{ Route::is('admin.size.*') ? 'active' : '' }}"><i
                    class="bi bi-arrows-angle-expand me-2"></i>
                Sizes</a></li>
        <li class="nav-item"><a href="{{ route('admin.product.index') }}"
                class="nav-link {{ Route::is('admin.product.*') ? 'active' : '' }}"><i class="bi bi-gift me-2"></i>
                Products</a></li>
    </ul>
</nav>
