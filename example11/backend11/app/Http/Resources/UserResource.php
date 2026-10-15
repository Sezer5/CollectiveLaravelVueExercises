<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'name' => $this->name,
            'address' => $this->address,
            'country' => $this->country,
            'zip_code' => $this->zip_code,
            'profile_completed' => $this->profile_completed,
            'profile_image' => $this->profile_image,
            'email' => $this->email,
            'roles' => $this->whenLoaded('roles'),
        ];
    }
}
