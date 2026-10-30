<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthAdminRequest;
use App\Http\Resources\AdminResource;
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

            if (!$user || !Hash::check($request->password, $user->password || !$user->hasRole('admin'))) {
                return response()->json([
                    'error' => 'These credentials do not match our records or you are not have an admin role'
                ]);
            } else {
                return response()->json([
                    'user' => AdminResource::make($user->load('roles')),
                    'access-token' => $user->createToken('new_admin')->plainTextToken,
                    'message' => 'Logged in successfully'
                ]);
            }
        }
    }

    public function update(Request $request)
    {

        $user = $request->user();

        if ($request->has('profile_image')) {

            $request->validate([
                'profile_image' => 'images|mimes:png,jpg,jpeg,webp|max:2048'
            ]);

            if ($request->user()->profile_image) {
                $this->deleteImage($request->user()->profile_image);
            }

            $imagePath = $this->saveImage($request->file('profile_image'));

            $request->user()->update([
                'profile_image' => $imagePath
            ]);

            return response()->json([
                'user' => AdminResource::make($user->load('roles')),
                'message' => 'Profile image updated succesfully'
            ]);
        } else {

            $request->user()->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code
            ]);

            return response()->json([
                'user' => AdminResource::make($user->load('roles')),
                'message' => 'Profile image updated succesfully'
            ]);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'Logged out successfully'
        ]);
    }

    public function saveImage($file)
    {
        $path = $file->store('images/admin', 'public');
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
