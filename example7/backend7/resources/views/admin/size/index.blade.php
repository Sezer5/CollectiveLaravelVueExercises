    @extends('layouts.adminlayout')
    @section('title')
        Sizes
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Sizes</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <div class="mb-3">
                                <a class="btn btn-success btn-sm" href="{{ route('admin.size.create') }}">
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
                                        @foreach ($sizes as $size)
                                            <tr>
                                                <td>{{ $size->id }}</td>
                                                <td>{{ $size->slug }}</td>
                                                <td>{{ $size->name }}</td>
                                                <td>
                                                    <a href="{{ route('admin.size.edit', $size->slug) }}"
                                                        class="btn btn-sm btn-warning ">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteItem({{ $size->id }})"
                                                        class="btn btn-sm btn-danger ">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                    <form id="{{ $size->id }}"
                                                        action="{{ route('admin.size.destroy', $size->slug) }}"
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
