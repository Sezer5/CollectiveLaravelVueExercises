    @extends('layouts.adminlayout')
    @section('title')
        Categories
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
                                <div class="col-md-4">
                                    <table class="table table-responsive table-bordered">
                                        <thead>
                                            <tr>
                                                <th colspan="4">
                                                    <h3>Categories</h3>
                                                </th>
                                                <th colspan="1">
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
                                                        <a href="{{ route('admin.category.edit', $category->slug) }}"
                                                            class="btn btn-warning btn-sm"><i class="bi bi-pencil"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="btn btn-danger btn-sm"
                                                            onclick=" deleteItem({{ $category->id }})"><i
                                                                class="bi bi-trash"></i></a>

                                                        <form id="{{ $category->id }}"
                                                            action="{{ route('admin.category.destroy', $category->slug) }}"
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
