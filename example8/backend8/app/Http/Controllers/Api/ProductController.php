<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return ProductResource::collection(
            Product::with(['colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterByColor(Color $color)
    {
        return ProductResource::collection(
            $color->products()->with(['colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterBySize(Size $size)
    {
        return ProductResource::collection(
            $size->products()->with(['colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function filterByTerm($term)
    {
        return ProductResource::collection(
            Product::where('name', 'LIKE', '%' . $term . '%')->with(['colors', 'sizes'])->latest()->get()
        )->additional([
            'colors' => Color::has('products')->latest()->get(),
            'sizes' => Size::has('products')->latest()->get(),
        ]);
    }

    public function productDetail(Product $product)
    {
        return ProductResource::make(
            $product->load(['colors', 'sizes'])
        );
    }
}
