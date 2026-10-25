<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Category extends Model
{
    protected $fillable = ['name', 'slug'];

    public function products()
    {
        return $this->hasMany(Product::class, 'id', 'category_id');
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
