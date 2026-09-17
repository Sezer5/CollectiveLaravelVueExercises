<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'category_id', 'description', 'quantity', 'price', 'thumbnail'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function colors()
    {
        return $this->belongsToMany(Color::class);
    }

    public function sizes()
    {
        return $this->belongsToMany(Size::class);
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
