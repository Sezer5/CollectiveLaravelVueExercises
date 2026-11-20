<?php

use App\Http\Controllers\Admin\AuthAdminController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SizeController;
use Illuminate\Support\Facades\Route;

Route::middleware(['role:admin'])->prefix('admin')->name('admin.')->group(function () {

    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 
    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 

    Route::get('logout', [AuthAdminController::class, "logout"])->name('logout');
    Route::get('index', [AuthAdminController::class, "index"])->name('index');

    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 
    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES

    Route::resource('/category', CategoryController::class);
    Route::resource('/color', ColorController::class);
    Route::resource('/size', SizeController::class);
    Route::resource('/product', ProductController::class);
});

Route::get('admin/login', [AuthAdminController::class, "login"])->name('admin.login');
Route::post('admin/auth', [AuthAdminController::class, "auth"])->name('admin.auth');
