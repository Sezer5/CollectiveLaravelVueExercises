<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'description', 'price', 'quantity', 'thumbnail'];

    public function sizes()
    {
        return $this->belongsToMany(Size::class);
    }

    public function colors()
    {
        return $this->belongsToMany(Color::class);
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
