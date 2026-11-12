<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'name' => $this->name,
            'price' => $this->price,
            'quantity' => $this->quantity,
            'thumbnail' => $this->thumbnail,
            'description' => $this->description,
            'category_id' => $this->category_id,
            'category' => $this->category,
            'colors' => $this->colors,
            'sizes' => $this->sizes
        ];
    }
}
