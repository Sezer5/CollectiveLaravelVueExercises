<?php

use App\Http\Controllers\Admin\AuthAdminController;
use Illuminate\Support\Facades\Route;

Route::middleware(['role:admin'])->prefix('admin')->name('admin.')->group(function () {

    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 
    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 

    Route::get('logout', [AuthAdminController::class, "logout"])->name('logout');
    Route::get('index', [AuthAdminController::class, "index"])->name('index');

    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 
    // ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES ADMIN ROUTES 

});

Route::get('admin/login', [AuthAdminController::class, "login"])->name('admin.login');
Route::post('admin/auth', [AuthAdminController::class, "auth"])->name('admin.auth');
