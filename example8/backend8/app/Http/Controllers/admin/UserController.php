<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddUserRequest;
use App\Http\Requests\AuthUserRequest;
use App\Http\Resources\Admin\UserResource;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function create(AddUserRequest $request)
    {
        if ($request->validated()) {
            $user = User::create($request->validated());
            DB::table('role_user')->insert([
                'role_id' => Role::where('name', 'user')->value('id'),
                'user_id' => $user->id,
            ]);
            return response()->json([
                'message' => 'User created succesfully'
            ]);
        }
    }

    public function auth(AuthUserRequest $request)
    {
        if ($request->validated()) {
            $user = User::whereEmail($request->email)->first();
            if (!$user && !Hash::check($request->password, $user->password)) {
                return response()->json([
                    'message' => 'These credentials do not match our records'
                ]);
            } else {
                return response()->json([
                    'user' => UserResource::make($user->load('roles')),
                    'access_token' => $user->createToken('new_user')->plainTextToken,
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

        if ($request->has('profile_image')) {

            if ($request->user()->profile_image) {
                $this->deleteImage($request->user()->profile_image);
            }
            $userImage = $this->saveImage($request->file('profile_image'));
            $user = $request->user();
            $user->update([
                'profile_image' => $userImage
            ]);

            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'User profile image updated successfully'
            ]);
        } else {
            $user = $request->user();
            $user->update([
                'address' => $request->address,
                'country' => $request->country,
                'zip_code' => $request->zip_code
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
