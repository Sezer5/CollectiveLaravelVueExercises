    @extends('layouts.adminlayout')
    @section('title')
        Product
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card border border-2">
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <div class="col-md-12">
                                    <table class="table table-responsive table-bordered">
                                        <thead>
                                            <tr>
                                                <th colspan="8">
                                                    <h3>Product</h3>
                                                </th>
                                                <th colspan="1">
                                                    <a href="{{ route('admin.product.create') }}">
                                                        <button class="btn btn-success btn-sm">
                                                            <i class="bi bi-plus"></i> Add
                                                        </button>
                                                    </a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>*</th>
                                                <th>Id</th>
                                                <th>Slug</th>
                                                <th>Name</th>
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
                                                    <td><img src="{{ asset($product->thumbnail) }}" width="60"></td>
                                                    <td>{{ $product->id }}</td>
                                                    <td>{{ $product->slug }}</td>
                                                    <td>{{ $product->name }}</td>
                                                    <td>{{ $product->category->name }}</td>
                                                    <td>
                                                        @foreach ($product->colors as $color)
                                                            <span
                                                                class="badge bg-info text-black">{{ $color->name }}</span>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        @foreach ($product->sizes as $size)
                                                            <span
                                                                class="badge bg-info text-black">{{ $size->name }}</span>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        <a href="{{ route('admin.product.edit', $product->slug) }}"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-pencil"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="btn btn-danger btn-sm"
                                                            onclick=" deleteItem({{ $product->id }})"><i
                                                                class="bi bi-trash"></i></a>

                                                        <form id="{{ $product->id }}"
                                                            action="{{ route('admin.product.destroy', $product->slug) }}"
                                                            method="POST">
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
            </div>
        </main>
    @endsection
