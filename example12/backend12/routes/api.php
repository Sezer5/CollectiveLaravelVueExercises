<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('/product/index', [ProductController::class, "index"])->name('product.index');
Route::get('/product/{product}/detail', [ProductController::class, "productDetail"])->name('product.detail');
Route::get('/product/{term}/term', [ProductController::class, "filterProductByTerm"])->name('product.term');
Route::get('/product/{size}/size', [ProductController::class, "filterProductBySize"])->name('product.size');
Route::get('/product/{color}/color', [ProductController::class, "filterProductByColor"])->name('product.color');
Route::get('/product/{category}/category', [ProductController::class, "filterProductByCategory"])->name('product.category');
