<?php

use App\Http\Controllers\Admin\AuthAdminController;
use App\Http\Resources\Admin\AuthAdminResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/user', function (Request $request) {
        $user = $request->user();
        return [
            'user' => AuthAdminResource::make($user->load('roles')),
            'access_token' => $request->bearerToken()
        ];
    });

    Route::middleware('role:admin')->prefix('admin')->group(function () {
        Route::post('/logout', [AuthAdminController::class, 'logout']);
        Route::put('/update', [AuthAdminController::class, 'update']);
    });
});

Route::post('/admin/auth', [AuthAdminController::class, "auth"])->name('admin.auth');
