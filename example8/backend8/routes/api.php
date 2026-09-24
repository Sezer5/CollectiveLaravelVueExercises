<?php

use App\Http\Controllers\Admin\UserController;
use App\Http\Resources\Admin\UserResource;
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

    Route::post('logout', [UserController::class, "logout"]);
    Route::put('update', [UserController::class, "update"]);
});

Route::post('auth', [UserController::class, "auth"]);
Route::post('create', [UserController::class, "create"]);
