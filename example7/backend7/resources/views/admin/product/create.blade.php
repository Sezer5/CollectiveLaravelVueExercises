    @extends('layouts.adminlayout')
    @section('title')
        Product Create
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Product Create</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <form action="{{ route('admin.product.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="mb-3">
                                    <label for="" class="form-label">Name</label>
                                    <input type="text" class="form-control @error('name') is-invalid @enderror"
                                        name="name" id="name" aria-describedby="helpId"
                                        placeholder="Please enter name*" value="{{ old('name') }}" />
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
                                        placeholder="Please enter quantity*" value="{{ old('quantity') }}" />
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
                                        placeholder="Please enter price*" value="{{ old('price') }}" />
                                    @error('price')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Category</label>
                                    <select class="form-select form-select" name="category_id" id="category_id">
                                        <option selected disabled>Select one</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Colors</label>
                                    <select multiple class="form-select form-select" name="color_id[]" id="color_id[]">
                                        @foreach ($colors as $color)
                                            <option value="{{ $color->id }}">{{ $color->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Sizes</label>
                                    <select multiple class="form-select form-select" name="size_id[]" id="size_id[]">
                                        @foreach ($sizes as $size)
                                            <option value="{{ $size->id }}">{{ $size->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Description</label>
                                    <textarea class="form-control" name="description" rows="3"></textarea>
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
