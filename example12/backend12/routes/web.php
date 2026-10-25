<?php

use App\Http\Controllers\Admin\AdminController;
use Illuminate\Support\Facades\Route;

Route::middleware('role:admin')->prefix('admin')->name('admin.')->group(function () {
    Route::get('index', [AdminController::class, "index"])->name('index');
    Route::get('logout', [AdminController::class, "logout"])->name('logout');
});

Route::post('admin/auth', [AdminController::class, "auth"])->name('admin.auth');
Route::get('admin/login', [AdminController::class, "login"])->name('admin.login');
