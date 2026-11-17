<?php

use App\Http\Controllers\Api\GalleryController;
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

    Route::get('/user/logout', [UserController::class, "logout"])->name('user.logout');
    Route::put('/user/update', [UserController::class, "update"])->name('user.update');

    Route::get('/gallery', [GalleryController::class, "index"])->name('gallery.index');
    Route::post('/gallery/store', [GalleryController::class, "store"])->name('gallery.store');
    Route::delete('/gallery/{gallery}/destroy', [GalleryController::class, "destroy"])->name('gallery.destroy');
});

Route::post('/user/register', [UserController::class, "register"])->name('user.register');
Route::post('/user/auth', [UserController::class, "auth"])->name('user.auth');
