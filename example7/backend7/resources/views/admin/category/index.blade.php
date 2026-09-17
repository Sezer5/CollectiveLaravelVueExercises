    @extends('layouts.adminlayout')
    @section('title')
        Categories
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Categories</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <div class="mb-3">
                                <a class="btn btn-success btn-sm" href="{{ route('admin.category.create') }}">
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
                                                        class="btn btn-sm btn-warning ">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteItem({{ $category->id }})"
                                                        class="btn btn-sm btn-danger ">
                                                        <i class="bi bi-trash"></i>
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
        </main>
    @endsection
