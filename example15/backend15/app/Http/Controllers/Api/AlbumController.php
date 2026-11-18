<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddAlbumRequest;
use App\Http\Resources\AlbumResource;
use App\Http\Resources\UserResource;
use App\Models\Album;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class AlbumController extends Controller
{
    public function index()
    {
        return AlbumResource::collection(
            Album::all()
        );
    }

    public function store(AddAlbumRequest $request)
    {
        if ($request->validated()) {
            $user = $request->user();
            $data = $request->validated();
            $data['image'] = $this->saveImage($request->file('image'));
            Album::create($data);
            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'Album created successfully'
            ]);
        }
    }

    public function destroy(Album $album)
    {
        $this->deleteImage($album->image);
        $album->delete();
        return response()->json([
            'message' => 'Album deleted successfully'
        ]);
    }

    public function saveImage($file)
    {
        $path = $file->store('images/albums', 'public');
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
