<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminResource extends JsonResource
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
            'email' => $this->email,
            'password' => $this->password,
            'profile_image' => $this->profile_image,
            'profile_completed' => $this->profile_completed,
            'address' => $this->address,
            'country' => $this->country,
            'zip_code' => $this->zip_code,
            'roles' => $this->whenLoaded('roles')
        ];
    }
}
