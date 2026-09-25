<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AuthAdminResource extends JsonResource
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
            'address' => $this->address,
            'country' => $this->country,
            'zip_code' => $this->zip_code,
            'profile_image' => $this->profile_image,
            'profile_completed' => $this->profile_completed,
            'roles' => $this->whenLoaded('roles'),
        ];
    }
}
