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
            'email' => $this->email,
            'country' => $this->country,
            'zip_code' => $this->zip_code,
            'address' => $this->address,
            'profile_image' => $this->profile_image,
            'profile_completed' => $this->profile_completed,
            'password' => $this->password,
        ];
    }
}
