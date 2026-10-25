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
                                    <h3>Colors</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th colspan="5" class="text-end">
                                                    <a href="{{ route('admin.color.create') }}">
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
                                            @foreach ($colors as $color)
                                                <tr>
                                                    <td>{{ $color->id }}</td>
                                                    <td>{{ $color->slug }}</td>
                                                    <td>{{ $color->name }}</td>
                                                    <td>
                                                        <a class="btn btn-warning btn-sm"
                                                            href="{{ route('admin.color.edit', $color->slug) }}">
                                                            <i class="bi bi-pencil">
                                                            </i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger btn-sm" href="#"
                                                            onclick="deleteItem({{ $color->id }})">
                                                            <i class="bi bi-trash">
                                                            </i>
                                                        </a>
                                                        <form id="{{ $color->id }}"
                                                            action="{{ route('admin.color.destroy', $color->slug) }}"
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
