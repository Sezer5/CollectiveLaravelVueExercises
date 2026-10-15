<?php

use App\Http\Controllers\Api\AuthUserController;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', function (Request $request) {
        $user = $request->user();
        return [
            'user' => UserResource::make($user->load('roles')),
            'access_token' => $request->bearerToken()
        ];
    });

    Route::post('user/logout', [AuthUserController::class, "logout"]);
    Route::put('user/update', [AuthUserController::class, "update"]);
});

Route::post('user/auth', [AuthUserController::class, "auth"]);
Route::post('user/create', [AuthUserController::class, "create"]);
