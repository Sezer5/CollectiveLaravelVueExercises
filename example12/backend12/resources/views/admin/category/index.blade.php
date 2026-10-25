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
                                    <h3>Categories</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th colspan="5" class="text-end">
                                                    <a href="{{ route('admin.category.create') }}">
                                                        <button class="btn btn-success btn-sm">
                                                            <i class="bi bi-plus"></i> Add
                                                        </button>
                                                    </a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>Id</th>
                                                <th>Slug</th>
                                                <th>Name</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($categories as $category)
                                                <tr>
                                                    <td>{{ $category->id }}</td>
                                                    <td>{{ $category->slug }}</td>
                                                    <td>{{ $category->name }}</td>
                                                    <td>
                                                        <a class="btn btn-warning btn-sm"
                                                            href="{{ route('admin.category.edit', $category->slug) }}">
                                                            <i class="bi bi-pencil">
                                                            </i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger btn-sm" href="#"
                                                            onclick="deleteItem({{ $category->id }})">
                                                            <i class="bi bi-trash">
                                                            </i>
                                                        </a>
                                                        <form id="{{ $category->id }}"
                                                            action="{{ route('admin.category.destroy', $category->slug) }}"
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
