<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/products', [ProductController::class, "index"]);
Route::get('/products/{category}/category', [ProductController::class, "getProductByCategory"]);
Route::get('/products/{color}/color', [ProductController::class, "getProductByColor"]);
Route::get('/products/{size}/size', [ProductController::class, "getProductBySize"]);
Route::get('/products/{term}/term', [ProductController::class, "getProductByTerm"]);
Route::get('/products/{product}/product', [ProductController::class, "getProductDetail"]);
