<?php

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
    Route::put('user/update', [UserController::class, "update"]);
});

Route::post('user/auth', [UserController::class, "auth"]);
Route::post('user/register', [UserController::class, "register"]);
