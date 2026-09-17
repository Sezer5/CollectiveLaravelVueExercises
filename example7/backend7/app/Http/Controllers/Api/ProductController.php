<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return ProductResource::collection(
            Product::with(['category', 'colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
            'categories' => Category::has('products')->latest()->get(),
        ]);
    }

    public function getProductByCategory(Category $category)
    {
        return ProductResource::collection(
            $category->products()->with(['category', 'colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
            'categories' => Category::has('products')->latest()->get(),
        ]);
    }

    public function getProductByColor(Color $color)
    {
        return ProductResource::collection(
            $color->products()->with(['category', 'colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
            'categories' => Category::has('products')->latest()->get(),
        ]);
    }

    public function getProductBySize(Size $size)
    {
        return ProductResource::collection(
            $size->products()->with(['category', 'colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
            'categories' => Category::has('products')->latest()->get(),
        ]);
    }

    public function getProductByTerm($term)
    {
        return ProductResource::collection(
            Product::where('name', 'LIKE', '%' . $term . '%')->with(['category', 'colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
            'categories' => Category::has('products')->latest()->get(),
        ]);
    }

    public function getProductDetail(Product $product)
    {
        return ProductResource::make(
            $product->load(['category', 'colors', 'sizes'])
        );
    }
}
