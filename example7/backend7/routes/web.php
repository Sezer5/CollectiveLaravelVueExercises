<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SizeController;
use Illuminate\Support\Facades\Route;

Route::middleware('role:admin')->prefix('admin')->name('admin.')->group(function () {
    Route::get('index', [AdminController::class, "index"])->name('index');
    Route::get('logout', [AdminController::class, "logout"])->name('logout');

    Route::resource('category', CategoryController::class);
    Route::resource('color', ColorController::class);
    Route::resource('size', SizeController::class);
    Route::resource('product', ProductController::class);
});

Route::get('admin/login', [AdminController::class, "login"])->name('admin.login');
Route::post('admin/auth', [AdminController::class, "auth"])->name('admin.auth');
