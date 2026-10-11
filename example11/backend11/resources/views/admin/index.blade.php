    @extends('layouts.adminlayout')
    @section('title')
        Home
    @endsection
    @section('content')
         <main class="p-4">
            <div class="container-fluid">
                <h2 class="mb-4 fw-bold" style="color: var(--dark-color);">Kontrol Paneli</h2>

                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card p-3">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 text-success fs-1">
                                    <i class="bi bi-currency-dollar"></i>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-muted mb-0">Toplam Kazanç</p>
                                    <h4 class="fw-bold mb-0">₺45.200</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card p-3">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0 text-primary fs-1">
                                    <i class="bi bi-bag-check"></i>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-muted mb-0">Tamamlanan Sipariş</p>
                                    <h4 class="fw-bold mb-0">1.240</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card p-4">
                    <h5 class="fw-bold mb-3">Sistem Durumu</h5>
                    <p class="text-muted">Buraya admin panelinizin ana tablo veya grafik verileri gelecektir. İlk temanın tüm renk kodları ve gölge derinlikleri korunmuştur.</p>
                </div>
            </div>
        </main>
    @endsection