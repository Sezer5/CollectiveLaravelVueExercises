<?php

use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/user', function (Request $request) {
        $user = $request->user();
        return [
            'user' => UserResource::make($user->load('roles')),
            'access_token' => $request->bearerToken()
        ];
    });

    Route::put('/user/update', [UserController::class, "update"])->name('user.update');
    Route::get('/user/logout', [UserController::class, "logout"])->name('user.logout');
});

Route::get('/products', [ProductController::class, "index"])->name('products');
Route::get('/products/{category}/category', [ProductController::class, "getProductByCategory"])->name('products.category');
Route::get('/products/{color}/color', [ProductController::class, "getProductByColor"])->name('products.color');
Route::get('/products/{size}/size', [ProductController::class, "getProductBySize"])->name('products.size');
Route::get('/products/{term}/term', [ProductController::class, "getProductByTerm"])->name('products.term');
Route::get('/products/{product}/product', [ProductController::class, "getProductDetail"])->name('products.product');

Route::post('/user/register', [UserController::class, "register"])->name('user.register');
Route::post('/user/auth', [UserController::class, "auth"])->name('user.auth');
