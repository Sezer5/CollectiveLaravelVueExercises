<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddUserRequest;
use App\Http\Requests\AuthUserRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function create(AddUserRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            User::create($data);

            return response()->json([
                'success' => 'User created successfully'
            ]);
        }
    }

    public function auth(AuthUserRequest $request)
    {
        if ($request->validated()) {
            $user = User::whereEmail($request->email)->first();

            if ($user && Hash::check($request->password, $user->password)) {
                return response()->json([
                    'user' => UserResource::make($user->load('roles')),
                    'access_token' => $user->createToken('new_user')->plainTextToken,
                    'message' => 'User logged in successfully'
                ]);
            } else {
                return response()->json([
                    'error' => 'These credentials do not match our records'
                ], 401);
            }
        }
    }

    public function update(Request $request)
    {
        dd($request->all(), $request->file('profile_image'));

        $user = $request->user();

        if ($request->profile_image) {

            $request->validate([
                'profile_image' => 'image|mimes:png,jpg,jpeg,webp|max:2048'
            ]);

            if ($request->user()->profile_image) {
                $this->deleteImage($request->user()->profile_image);
            }

            $image_path = $this->saveImage($request->file('profile_image'));

            $user->update([
                'profile_image' => $image_path
            ]);

            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'User image updated successfully'
            ]);
        } else {
            $user->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code
            ]);

            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'User image updated successfully'
            ]);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'User logged out successfully'
        ]);
    }

    public function saveImage($file)
    {
        $path = $file->store('images/user', 'public');
        return 'storage/' . $path;
    }

    public function deleteImage($file)
    {
        $path = public_path($file);
        if (File::exists($path)) {
            File::delete($path);
        }
    }
}
