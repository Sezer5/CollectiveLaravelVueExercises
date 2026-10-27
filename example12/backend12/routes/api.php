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
    Route::post('/user/logout', [UserController::class, "logout"])->name('user.logout');
});


Route::get('/product/index', [ProductController::class, "index"])->name('product.index');
Route::get('/product/{product}/detail', [ProductController::class, "productDetail"])->name('product.detail');
Route::get('/product/{term}/term', [ProductController::class, "filterProductByTerm"])->name('product.term');
Route::get('/product/{size}/size', [ProductController::class, "filterProductBySize"])->name('product.size');
Route::get('/product/{color}/color', [ProductController::class, "filterProductByColor"])->name('product.color');
Route::get('/product/{category}/category', [ProductController::class, "filterProductByCategory"])->name('product.category');

Route::post('/user/register', [UserController::class, "register"])->name('user.register');
Route::post('/user/auth', [UserController::class, "auth"])->name('user.auth');
