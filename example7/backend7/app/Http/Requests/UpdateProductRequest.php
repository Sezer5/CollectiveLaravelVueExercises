<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|min:1|max:255',
            'price' => 'required|min:1|max:255',
            'quantity' => 'required|min:1|max:255',
            'category_id' => 'required|min:1|max:255',
            'description' => 'required|min:1',
            'thumbnail' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048'
        ];
    }
}
