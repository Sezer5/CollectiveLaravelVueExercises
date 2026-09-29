<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Size extends Model
{
    protected $fillable = ['name', 'slug'];

    public function products()
    {
        return $this->belongsToMany(Product::class);
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
