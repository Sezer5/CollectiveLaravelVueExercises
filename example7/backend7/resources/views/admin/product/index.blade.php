    @extends('layouts.adminlayout')
    @section('title')
        Products
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Products</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <a class="btn btn-success btn-sm" href="{{ route('admin.product.create') }}">
                                    <i class="bi bi-plus"></i> Add
                                </a>
                            </div>
                            <div class="mb-3">
                                <table class="table table-bordered table-responsive">
                                    <thead>
                                        <tr>
                                            <th>*</th>
                                            <th>Slug</th>
                                            <th>Name</th>
                                            <th>Thumbnail</th>
                                            <th>Category</th>
                                            <th>Colors</th>
                                            <th>Sizes</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $product)
                                            <tr>
                                                <td>{{ $product->id }}</td>
                                                <td>{{ $product->slug }}</td>
                                                <td>{{ $product->name }}</td>
                                                <td><img src="{{ asset($product->thumbnail) }}" width="60"></td>
                                                <td>{{ $product->category->name }}</td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        @foreach ($product->colors as $color)
                                                            <div style="background-color: {{ $color->code ?? $color->name }}; width: 15px; height: 15px; display: inline-block; border-radius: 50%; border: 1px solid #ccc;"
                                                                title="{{ $color->name }}">
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-center">
                                                        @foreach ($product->sizes as $size)
                                                            <span class="badge bg-secondary mx-1">
                                                                {{ $size->name }}
                                                            </span>
                                                        @endforeach
                                                    </div>
                                                </td>
                                                <td>
                                                    <a href="{{ route('admin.product.edit', $product->slug) }}"
                                                        class="btn btn-sm btn-warning ">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteItem({{ $product->id }})"
                                                        class="btn btn-sm btn-danger ">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                    <form id="{{ $product->id }}"
                                                        action="{{ route('admin.product.destroy', $product->slug) }}"
                                                        method="post">
                                                        @csrf
                                                        @method('DELETE')
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    @endsection
