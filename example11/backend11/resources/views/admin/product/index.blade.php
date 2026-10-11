    @extends('layouts.adminlayout')
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 card mb-4">
                        <div class="col-md-12 my-4">
                            <table class="table-responsive table table-bordered">
                                <thead>
                                    <tr>
                                        <th colspan=8>
                                            <h3>Products</h3>
                                        </th>
                                        <th>
                                            <a href="{{ route('admin.product.create') }}">
                                                <button class="btn btn-success"><i class="bi bi-plus"></i></button>
                                            </a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>Id</th>
                                        <th>Thumbnail</th>
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
                                            <td>{{ $product->id }}</td>
                                            <td>
                                                <img src="{{ asset($product->thumbnail) }}" width="30">
                                            </td>
                                            <td>{{ $product->slug }}</td>
                                            <td>{{ $product->name }}</td>
                                            <td>{{ $product->category->name }}</td>
                                            <td>
                                                @foreach ($product->colors as $color)
                                                    <span>{{ $color->name }}</span>
                                                @endforeach
                                            </td>
                                            <td>
                                                @foreach ($product->sizes as $size)
                                                    <span>{{ $size->name }}</span>
                                                @endforeach
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.product.edit', $product->slug) }}"
                                                    class="btn btn-warning">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="#" onclick="deleteItem({{ $product->id }})"
                                                    class="btn btn-danger">
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
        </main>
    @endsection
