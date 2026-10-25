<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'quantity', 'price', 'thumbnail', 'description', 'category_id'];

    public function colors()
    {
        return $this->belongsToMany(Color::class);
    }

    public function sizes()
    {
        return $this->belongsToMany(Size::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
