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
                            <div class="col-md-12">
                                <div class="card-header">
                                    <h3>Products</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th colspan="9" class="text-end">
                                                    <a href="{{ route('admin.product.create') }}">
                                                        <button class="btn btn-success btn-sm">
                                                            <i class="bi bi-plus"></i> Add
                                                        </button>
                                                    </a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>Id</th>
                                                <th>*</th>
                                                <th>Slug</th>
                                                <th>Name</th>
                                                <th>Colors</th>
                                                <th>Sizes</th>
                                                <th>Category</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($products as $product)
                                                <tr>
                                                    <td>{{ $product->id }}</td>
                                                    <td>
                                                        <img src="{{ asset($product->thumbnail) }}" width="30">
                                                    </td>
                                                    <td>{{ $product->slug }}</td>
                                                    <td>{{ $product->name }}</td>
                                                    <td>
                                                        @foreach ($product->colors as $color)
                                                            <span class="bg-dark text-white mx-1 p-1 rounded">
                                                                {{ $color->name }}
                                                            </span>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        @foreach ($product->sizes as $size)
                                                            <span class="bg-dark text-white mx-1 p-1 rounded">
                                                                {{ $size->name }}
                                                            </span>
                                                        @endforeach
                                                    </td>
                                                    <td>
                                                        <span class="bg-dark text-white mx-1 p-1 rounded">
                                                            {{ $product->category->name }}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-warning btn-sm"
                                                            href="{{ route('admin.product.edit', $product->slug) }}">
                                                            <i class="bi bi-pencil">
                                                            </i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger btn-sm" href="#"
                                                            onclick="deleteItem({{ $product->id }})">
                                                            <i class="bi bi-trash">
                                                            </i>
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
            </div>
        </main>
    @endsection
