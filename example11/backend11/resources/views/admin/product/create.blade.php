    @extends('layouts.adminlayout')
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 card mb-4">
                        <h3>Create</h3>
                        <hr>
                        <div class="col-md-4 my-4">
                            <form action="{{ route('admin.product.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="mb-3">
                                    <label for="" class="form-label">Name*</label>
                                    <input type="text" class="form-control" name="name" id="name"
                                        aria-describedby="helpId" placeholder="Please enter a name*"
                                        value="{{ old('name') }}" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Quantity*</label>
                                    <input type="text" class="form-control" name="quantity" id="quantity"
                                        aria-describedby="helpId" placeholder="Please enter a quantity*"
                                        value="{{ old('quantity') }}" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Price*</label>
                                    <input type="text" class="form-control" name="price" id="price"
                                        aria-describedby="helpId" placeholder="Please enter a price*"
                                        value="{{ old('price') }}" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Description*</label>
                                    <textarea name="description" class="form-control">{{ old('description') }}</textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Thumbnail*</label>
                                    <input type="file" class="form-control" name="thumbnail" id="thumbnail"
                                        aria-describedby="helpId" placeholder="Please enter a thumbnail*" />
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Category</label>
                                    <select class="form-select form-select-sm" name="category_id" id="category_id">
                                        <option selected>Select one</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Colors</label>
                                    <select multiple class="form-select form-select-sm" name="color_id[]" id="color_id">
                                        <option selected>Select one</option>
                                        @foreach ($colors as $color)
                                            <option value="{{ $color->id }}">{{ $color->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="" class="form-label">Sizes</label>
                                    <select multiple class="form-select form-select-sm" name="size_id[]" id="size_id">
                                        <option selected>Select one</option>
                                        @foreach ($sizes as $size)
                                            <option value="{{ $size->id }}">{{ $size->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="mb-3 text-end">
                                    <button class="btn btn-success" type="submit">
                                        <i class="bi bi-plus"></i> Add
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </main>
    @endsection
