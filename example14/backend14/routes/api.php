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

    Route::put('/user/update', [UserController::class, "update"]);
    Route::get('/user/logout', [UserController::class, "logout"]);
});



Route::get("/products", [ProductController::class, "index"])->name("products");
Route::get("/products/{category}/category", [ProductController::class, "getProductsByCategory"])->name("category");
Route::get("/products/{color}/color", [ProductController::class, "getProductsByColor"])->name("color");
Route::get("/products/{size}/size", [ProductController::class, "getProductsBySize"])->name("size");
Route::get("/products/{term}/term", [ProductController::class, "getProductsByTerm"])->name("term");
Route::get("/products/{product}/product", [ProductController::class, "getProductDetail"])->name("product");


Route::post('/user/create', [UserController::class, "create"]);
Route::post('/user/auth', [UserController::class, "auth"]);
