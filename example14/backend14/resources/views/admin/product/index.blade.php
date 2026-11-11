    @extends('layouts.adminlayout')
    @section('title')
        Product
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="card-header col-md-12 d-flex justify-content-between align-items-center">
                                <h3>Product</h3>
                                <a href="{{ route('admin.product.create') }}" class="btn btn-lg btn-success">
                                    <i class="bi bi-plus"></i> Add
                                </a>
                            </div>
                            <div class="card-body col-md-12">
                                <table class="table table-responsive table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>*</th>
                                            <th>Slug</th>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
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
                                                <td><img src="{{ asset($product->thumbnail) }}" width="60"></td>
                                                <td>{{ $product->slug }}</td>
                                                <td>{{ $product->name }}</td>
                                                <td>{{ $product->quantity }}</td>
                                                <td>{{ $product->price }}</td>
                                                <td>{{ $product->category->name }}</td>
                                                <td>
                                                    <div class="d-flex justify-content-around">
                                                        @foreach ($product->colors as $color)
                                                            <div
                                                                style="width: 20px;height:20px;background-color:{{ $color->name }};border-radius:20px">
                                                            </div>
                                                        @endforeach
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="d-flex justify-content-around">
                                                        @foreach ($product->sizes as $size)
                                                            <span
                                                                class="badge bg-dark text-white mx-6">{{ $size->name }}</span>
                                                        @endforeach
                                                    </div>
                                                </td>
                                                <td>
                                                    <a href="{{ route('admin.product.edit', $product->slug) }}"
                                                        class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></a>
                                                </td>
                                                <td>
                                                    <button class="btn btn-danger btn-sm"
                                                        onclick="deleteItem({{ $product->id }})">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
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
