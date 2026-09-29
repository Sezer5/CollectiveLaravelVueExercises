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
                            <div>
                                <a href="{{ route('admin.product.create') }}"><button class="btn btn-success"><i
                                            class="bi bi-plus"></i>
                                        Add</button>
                                </a>
                            </div>
                            <div class="col-md-12 mt-2">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>*</th>
                                            <th>Id</th>
                                            <th>Slug</th>
                                            <th>Name</th>
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
                                                <td>
                                                    @foreach ($product->colors as $color)
                                                        <div
                                                            style="background-color:{{ $color->name }};width:10px;height:10px;border-radius:100%;display:inline-block">
                                                        </div>
                                                    @endforeach
                                                </td>
                                                <td>
                                                    @foreach ($product->sizes as $size)
                                                        <span class="badge bg-dark text-white">{{ $size->name }}</span>
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
                                                </td>
                                                <form id="{{ $product->id }}"
                                                    action="{{ route('admin.product.destroy', $product->slug) }}"
                                                    method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                </form>
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
