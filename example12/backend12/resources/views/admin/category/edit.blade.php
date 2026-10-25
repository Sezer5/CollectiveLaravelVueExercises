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
                                    <h3>Category Edit</h3>
                                </div>
                                <div class="card-body">
                                    <form action="{{ route('admin.category.update', $category->slug) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <div class="mb-3">
                                            <label for="" class="form-label">Name</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" id="name" aria-describedby="helpId"
                                                placeholder="Please enter a name*"
                                                value="{{ $category->name, old('name') }}" />
                                            @error('name')
                                                <span class="invalid-feedback">{{ $message }}</span>
                                            @enderror
                                        </div>
                                        <div class="mb-3 text-end">
                                            <button class="btn btn-success btn-sm"><i class="bi bi-upload"></i>
                                                Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
