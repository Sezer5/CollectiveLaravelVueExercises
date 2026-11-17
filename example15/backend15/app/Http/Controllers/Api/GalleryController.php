<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddGalleryRequest;
use App\Http\Resources\GalleryResource;
use App\Http\Resources\UserResource;
use App\Models\Gallery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class GalleryController extends Controller
{
    public function index()
    {
        return GalleryResource::collection(
            Gallery::all()
        );
    }

    public function store(AddGalleryRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['image'] = $this->saveImage($request->image('image'));
            $user = $request->user();
            Gallery::create($data);

            return response()->json([
                'user' => UserResource::make($user->load('roles')),
                'message' => 'Gallery object created successfully'
            ]);
        }
    }

    public function destroy(Gallery $gallery)
    {
        $this->deleteImage($gallery->image);
        $gallery->delete();
        return response()->json([
            'message' => 'Gallery object deleted successfully'
        ]);
    }

    public function saveImage($file)
    {
        $path = $file->store('images/gallery', 'public');
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
