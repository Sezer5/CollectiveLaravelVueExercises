<?php

use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return [
            'user' => UserResource::make($request->user()),
            'access_token' => $request->bearerToken()
        ];
    });

    Route::put('user/profile/update', [UserController::class, "updateUser"]);
    Route::post('user/logout', [UserController::class, "logoutUser"]);
});



Route::get('/products', [ProductController::class, "index"]);
Route::get('/products/{category}/category', [ProductController::class, "getProductByCategory"]);
Route::get('/products/{color}/color', [ProductController::class, "getProductByColor"]);
Route::get('/products/{size}/size', [ProductController::class, "getProductBySize"]);
Route::get('/products/{term}/term', [ProductController::class, "getProductByTerm"]);
Route::get('/products/{product}/product', [ProductController::class, "getProductDetail"]);

Route::post('/user/register', [UserController::class, "createUser"]);
Route::post('/user/login', [UserController::class, "authUser"]);
