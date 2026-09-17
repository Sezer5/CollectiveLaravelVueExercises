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
    public function createUser(AddUserRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            User::create($data);
            return response()->json([
                'message' => 'User created successfully'
            ]);
        }
    }

    public function authUser(AuthUserRequest $request)
    {
        if ($request->validated()) {
            $user = User::whereEmail($request->email)->first();
            if (!$user && !Hash::check($user->password, $request->password)) {
                return response()->json([
                    'message' => 'These credentials do not match our records'
                ]);
            } else {
                return response()->json([
                    'user' => UserResource::make($user),
                    'access_token' => $user->createToken('new_user')->plainTextToken,
                    'message' => 'User logged in successfully'
                ]);
            }
        }
    }

    public function updateUser(Request $request)
    {
        $request->validate([
            'profile_image' => 'image|mimes:jpg,png,jpeg,webp|max:2048'
        ]);

        if ($request->hasFile('profile_image')) {
            if ($request->user()->profile_image) {
                $this->deleteImage($request->user()->profile_image);
            }
            $profile_image = $this->saveImage($request->file('profile_image'));
            $request->user()->update([
                'profile_image' => $profile_image
            ]);
            return response()->json([
                'user' => UserResource::make($request->user()),
                'message' => 'User profile image updated successfully'
            ]);
        } else {
            $request->user()->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code,
                'profile_completed' => 1
            ]);
            return response()->json([
                'user' => UserResource::make($request->user()),
                'message' => 'User profile image updated successfully'
            ]);
        }
    }

    public function logoutUser(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'Logged out successfully'
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
