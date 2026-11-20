<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Override;

class Category extends Model
{
    protected $fillable = ['slug', 'name'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    #[Override]
    public function getRouteKeyName()
    {
        return "slug";
    }
}
