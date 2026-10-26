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
            Product::with(['category', 'sizes', 'colors'])->get()
        )->additional([
            'categories' => Category::has('products')->latest()->get(),
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterProductByColor(Color $color)
    {
        return ProductResource::collection(
            $color->products()->with(['category', 'sizes', 'colors'])->get()
        )->additional([
            'categories' => Category::has('products')->latest()->get(),
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterProductBySize(Size $size)
    {
        return ProductResource::collection(
            $size->products()->with(['category', 'sizes', 'colors'])->get()
        )->additional([
            'categories' => Category::has('products')->latest()->get(),
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterProductByCategory(Category $category)
    {
        return ProductResource::collection(
            $category->products()->with(['category', 'sizes', 'colors'])->get()
        )->additional([
            'categories' => Category::has('products')->latest()->get(),
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterProductByTerm($term)
    {
        return ProductResource::collection(
            Product::where('name', 'LIKE', '%' . $term . '%')->with(['category', 'sizes', 'colors'])->get()
        )->additional([
            'categories' => Category::has('products')->latest()->get(),
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function productDetail(Product $product)
    {
        return ProductResource::make(
            $product->load(['category', 'sizes', 'colors'])
        );
    }
}
