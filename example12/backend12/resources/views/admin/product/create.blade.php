    @extends('layouts.adminlayout')
    @section('title')
        Home
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="col-md-4">
                                <div class="card-header">
                                    <h3>Product Create</h3>
                                </div>
                                <div class="card-body">
                                    <form action="{{ route('admin.product.store') }}" method="POST"
                                        enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label for="" class="form-label">Name</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" id="name" aria-describedby="helpId"
                                                placeholder="Please enter a name*" value="{{ old('name') }}" />
                                            @error('name')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Quantity</label>
                                            <input type="text"
                                                class="form-control @error('quantity') is-invalid @enderror" name="quantity"
                                                id="quantity" aria-describedby="helpId"
                                                placeholder="Please enter a quantity*" value="{{ old('quantity') }}" />
                                            @error('quantity')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Price</label>
                                            <input type="text" class="form-control @error('price') is-invalid @enderror"
                                                name="price" id="price" aria-describedby="helpId"
                                                placeholder="Please enter a price*" value="{{ old('price') }}" />
                                            @error('price')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Thumbnail</label>
                                            <input type="file"
                                                class="form-control @error('thumbnail') is-invalid @enderror"
                                                name="thumbnail" id="thumbnail" aria-describedby="helpId"
                                                placeholder="Please enter a thumbnail*" value="{{ old('thumbnail') }}" />
                                            @error('thumbnail')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Category</label>
                                            <select class="form-select form-select-sm" name="category_id">
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('category_id')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Colors</label>
                                            <select multiple class="form-select form-select-sm" name="color_id[]">
                                                @foreach ($colors as $color)
                                                    <option value="{{ $color->id }}">{{ $color->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Sizes</label>
                                            <select multiple class="form-select form-select-sm" name="size_id[]">
                                                @foreach ($sizes as $size)
                                                    <option value="{{ $size->id }}">{{ $size->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">Description</label>
                                            <textarea class="form-control" name="description" rows="3"></textarea>
                                        </div>
                                        <div class="mb-3 text-end">
                                            <button class="btn btn-success btn-sm"><i class="bi bi-plus"></i> Add</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
