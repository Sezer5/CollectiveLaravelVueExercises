<?php

use App\Http\Controllers\Api\Admin\AuthAdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {

    Route::middleware(['role:admin'])->group(function () {

        Route::put('/admin/update', [AuthAdminController::class, "update"]);
        Route::get('/admin/logout', [AuthAdminController::class, "logout"]);
    });

    Route::middleware(['role:user'])->group(function () {
        // GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR 
    });
});


// ADMİN ROTALARI ADMİN ROTALARI ADMİN ROTALARI ADMİN ROTALARI ADMİN ROTALARI

Route::post('/admin/auth', [AuthAdminController::class, "auth"]);
