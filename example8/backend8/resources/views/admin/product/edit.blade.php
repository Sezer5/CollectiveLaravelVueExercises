    @extends('layouts.adminlayout')
    @section('title')
        Edit
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="col-md-4">
                                <form action="{{ route('admin.product.update', $product->slug) }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <div class="mb-3">
                                        <label for="" class="form-label">Name*</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" id="name" aria-describedby="helpId"
                                            placeholder="Please enter a name*" value="{{ $product->name, old('name') }}" />
                                        @error('name')
                                            <span class="invalid-feedback">
                                                {{ $message }}
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Quantity*</label>
                                        <input type="text" class="form-control @error('quantity') is-invalid @enderror"
                                            name="quantity" id="quantity" aria-describedby="helpId"
                                            placeholder="Please enter a quantity*"
                                            value="{{ $product->quantity, old('quantity') }}" />
                                        @error('quantity')
                                            <span class="invalid-feedback">
                                                {{ $message }}
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Price*</label>
                                        <input type="text" class="form-control @error('price') is-invalid @enderror"
                                            name="price" id="price" aria-describedby="helpId"
                                            placeholder="Please enter a price*"
                                            value="{{ $product->price, old('price') }}" />
                                        @error('price')
                                            <span class="invalid-feedback">
                                                {{ $message }}
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Description*</label>
                                        <textarea class="form-control" name="description" id="" rows="3">{{ $product->description, old('description') }}</textarea>
                                        @error('description')
                                            <span class="invalid-feedback">
                                                {{ $message }}
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Thumbnail</label>
                                        <input type="file" class="form-control" name="thumbnail" id="thumbnail"
                                            placeholder="Please enter thumbnail*" aria-describedby="fileHelpId" />
                                        @error('description')
                                            <span class="invalid-feedback">
                                                {{ $message }}
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Colors</label>
                                        <select multiple class="form-select form-select-sm" name="color_id[]"
                                            id="color_id">
                                            @foreach ($colors as $color)
                                                <option value="{{ $color->id }}"
                                                    @if ($product->colors->contains($color->id)) selected @endif>{{ $color->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">Sizes</label>
                                        <select multiple class="form-select form-select-sm" name="size_id[]" id="size_id">
                                            @foreach ($sizes as $size)
                                                <option value="{{ $size->id }}"
                                                    @if ($product->sizes->contains($size->id)) selected @endif>{{ $size->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>


                                    <div class="mb-3">
                                        <button class="btn btn-success" type="submit">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
