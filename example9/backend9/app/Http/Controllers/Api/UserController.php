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
    public function register(AddUserRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            User::create($data);
            return response()->json([
                'message' => 'User created successfully'
            ]);
        }
    }

    public function auth(AuthUserRequest $request)
    {
        if ($request->validated()) {
            $user = User::whereEmail($request->email)->first();
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response()->json([
                    'error' => 'These credentials do not match to our records'
                ]);
            } else {
                return response()->json([
                    'user' => UserResource::make($user->load('roles')),
                    'access_token' => $user->createToken('new_user')->plainTextToken,
                    'message' => 'User created successfully'
                ]);
            }
        }
    }

    public function update(Request $request)
    {
        $request->validate([
            'profile_image' => 'image|mimes:png,jpg,jpeg,webp|max:2048'
        ]);
        $user = $request->user();
        if ($request->has('profile_image')) {

            if ($request->user()->profile_image) {
                $this->deleteImage($request->user()->profile_image);
                $profile_image_path = $this->saveImage($request->file('profile_image'));

                $request->user()->update([
                    'profile_image' => $profile_image_path
                ]);

                return response()->json([
                    'user' => UserResource::make($user->load('roles')),
                    'message' => 'User profile image updated successfully'
                ]);
            } else {
                $profile_image_path = $this->saveImage($request->file('profile_image'));

                $request->user()->update([
                    'profile_image' => $profile_image_path
                ]);

                return response()->json([
                    'user' => UserResource::make($user->load('roles')),
                    'message' => 'User profile image updated successfully'
                ]);
            }
        } else {
            $request->user()->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code,
            ]);

            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'User profile image updated successfully'
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
        $path = $file->store('images/users', 'public');
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
