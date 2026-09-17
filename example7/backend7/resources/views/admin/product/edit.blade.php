    @extends('layouts.adminlayout')
    @section('title')
        Product Edit
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Product Edit</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <form action="{{ route('admin.product.update', $product->slug) }}" method="post"
                                enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="mb-3">
                                    <label for="" class="form-label">Name</label>
                                    <input type="text" class="form-control @error('name') is-invalid @enderror"
                                        name="name" id="name" aria-describedby="helpId"
                                        placeholder="Please enter name*" value="{{ $product->name, old('name') }}" />
                                    @error('name')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Quantity</label>
                                    <input type="number" class="form-control @error('quantity') is-invalid @enderror"
                                        name="quantity" id="quantity" aria-describedby="helpId"
                                        placeholder="Please enter quantity*"
                                        value="{{ $product->quantity, old('quantity') }}" />
                                    @error('quantity')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Price</label>
                                    <input type="text" class="form-control @error('price') is-invalid @enderror"
                                        name="price" id="price" aria-describedby="helpId"
                                        placeholder="Please enter price*" value="{{ $product->price, old('price') }}" />
                                    @error('price')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Category</label>
                                    <select class="form-select form-select" name="category_id" id="category_id">
                                        <option selected value="{{ $product->category_id }}">{{ $product->category->name }}
                                        </option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Colors</label>
                                    <select multiple class="form-select form-select" name="color_id[]" id="color_id[]">
                                        @foreach ($colors as $color)
                                            <option value="{{ $color->id }}"
                                                @if ($product->colors->contains($color->id)) selected @endif>{{ $color->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Sizes</label>
                                    <select multiple class="form-select form-select" name="size_id[]" id="size_id[]">
                                        @foreach ($sizes as $size)
                                            <option value="{{ $size->id }}"
                                                @if ($product->sizes->contains($size->id)) selected @endif>{{ $size->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Description</label>
                                    <textarea class="form-control" name="description" id="" rows="3">{{ $product->description }}</textarea>
                                    @error('description')
                                        <span class="invalid-feedback">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Thumbnail</label>
                                    <input type="file" class="form-control" name="thumbnail" />
                                    @error('thumbnail')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>


                                <div class="mb-3">
                                    <button class="btn btn-success btn-sm" type="submit">
                                        Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    @endsection
