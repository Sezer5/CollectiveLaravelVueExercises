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
                                <a href="{{ route('admin.color.create') }}"><button class="btn btn-success"><i
                                            class="bi bi-plus"></i>
                                        Add</button>
                                </a>
                            </div>
                            <div class="col-md-4 mt-2">
                                <table class="table table-bordered">
                                    <thead>
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
                                                    <a href="{{ route('admin.color.edit', $color->slug) }}"
                                                        class="btn btn-warning">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" onclick="deleteItem({{ $color->id }})"
                                                        class="btn btn-danger">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </td>
                                                <form id="{{ $color->id }}"
                                                    action="{{ route('admin.color.destroy', $color->slug) }}" method="post">
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
