<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AuthAdminRequest;
use App\Http\Resources\Admin\AuthAdminResource;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class AuthAdminController extends Controller
{
    public function auth(AuthAdminRequest $request)
    {
        if ($request->validated()) {
            $user = User::whereEmail($request->email)->first();

            if (!$user || Hash::check($request->password, $user->password)) {
                return response()->json([
                    'message' => 'These credentials do not match our records'
                ]);
            } else {
                return response()->json([
                    'user' => AuthAdminResource::make($user),
                    'access_token' => $user->createToken('new_admin')->plainTextToken,
                    'message' => 'User logged in successfully'
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
            }
            $imagePath = $this->saveImage($request->file('profile_image'));
            $user->update([
                'profile_image' => $imagePath
            ]);
        } else {
            $user->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code,
            ]);
        }

        return response()->json([
            'user' => UserResource::make($user->load('roles')),
            'message' => 'User information updated successfully'
        ]);
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
