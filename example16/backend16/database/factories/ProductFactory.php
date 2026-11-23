<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Color;
use App\Models\Product;
use App\Models\Size;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends Factory<Product>
 */
class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition(): array
    {
        $name = ucfirst(fake()->unique()->words(2, true));

        return [
            'name'        => $name,
            'slug'        => Str::slug($name) . '-' . fake()->unique()->numberBetween(1, 9999),
            'thumbnail'   => 'storage/images/products/' . Str::random(40) . '.jpg',
            'description' => fake()->paragraph(),
            'quantity'    => fake()->numberBetween(0, 100),
            'price'       => fake()->randomFloat(2, 10, 999),
            'category_id' => Category::inRandomOrder()->value('id'),
        ];
    }

    public function configure(): static
    {
        return $this->afterCreating(function (Product $product) {
            $colorIds = Color::inRandomOrder()->take(rand(2, 9))->pluck('id');
            if ($colorIds->isNotEmpty()) {
                $product->colors()->sync($colorIds);
            }

            $sizeIds = Size::inRandomOrder()->take(rand(2, 7))->pluck('id');
            if ($sizeIds->isNotEmpty()) {
                $product->sizes()->sync($sizeIds);
            }
        });
    }
}
