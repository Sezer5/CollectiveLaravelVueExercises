    @extends('layouts.adminlayout')
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 card mb-4">
                        <div class="col-md-4 my-4">
                            <table class="table-responsive table table-bordered">
                                <thead>
                                    <tr>
                                        <th colspan=4>
                                            <h3>Categories</h3>
                                        </th>
                                        <th>
                                            <a href="{{ route('admin.category.create') }}">
                                                <button class="btn btn-success"><i class="bi bi-plus"></i></button>
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
                                                    class="btn btn-warning">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="#" onclick="deleteItem({{ $category->id }})"
                                                    class="btn btn-danger">
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
        </main>
    @endsection
