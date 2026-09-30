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

    Route::post('user/logout', [UserController::class, "logout"]);
    Route::put('user/update', [UserController::class, "edit"]);
});




Route::get('/products', [ProductController::class, "index"]);
Route::get('/products/{color}/color', [ProductController::class, "filterByColor"]);
Route::get('/products/{size}/size', [ProductController::class, "filterBySize"]);
Route::get('/products/{term}/term', [ProductController::class, "filterByTerm"]);
Route::get('/products/{product}/product', [ProductController::class, "productDetail"]);

Route::post('user/register', [UserController::class, "create"]);
Route::post('user/login', [UserController::class, "auth"]);
