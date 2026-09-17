<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.product.index')->with([
            'products' => Product::with(['category', 'colors', 'sizes'])->latest()->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.product.create')->with([
            'categories' => Category::all(),
            'colors' => Color::all(),
            'sizes' => Size::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AddProductRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            $data['thumbnail'] = $this->saveImage($request->file('thumbnail'));
            $product = Product::create($data);
            $product->colors()->sync($request->color_id);
            $product->sizes()->sync($request->size_id);
            return redirect()->route('admin.product.index')->with([
                'success' => 'Product created successfully!'
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        abort(403);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        return view('admin.product.edit')->with([
            'product' => $product->load(['category', 'colors', 'sizes']),
            'categories' => Category::all(),
            'colors' => Color::all(),
            'sizes' => Size::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateProductRequest $request, Product $product)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            if ($request->has('thumbnail')) {
                $this->deleteImage($product->thumbnail);
                $data['thumbnail'] = $this->saveImage($request->file('thumbnail'));
            }
            $product->update($data);
            $product->colors()->sync($request->color_id);
            $product->sizes()->sync($request->size_id);
            return redirect()->route('admin.product.index')->with([
                'success' => 'Product updated successfully!'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $this->deleteImage($product->thumbnail);
        $product->delete();
        return redirect()->route('admin.product.index')->with([
            'success' => 'Product deleted successfully!'
        ]);
    }

    public function saveImage($file)
    {
        $path = $file->store('images/products', 'public');
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
