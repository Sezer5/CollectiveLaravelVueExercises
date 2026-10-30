<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {

    Route::middleware(['role:admin'])->group(function () {
        // GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR 
    });

    Route::middleware(['role:user'])->group(function () {
        // GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR GEREKLİ ROTALAR 
    });
});
