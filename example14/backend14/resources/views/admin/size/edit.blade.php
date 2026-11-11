    @extends('layouts.adminlayout')
    @section('title')
        Size Add
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="card-header col-md-4 d-flex justify-content-between align-items-center">
                                <h3>size Add</h3>
                            </div>
                            <div class="card-body col-md-4">
                                <form action="{{ route('admin.size.update', $size->slug) }}" method="post">
                                    @csrf
                                    @method('PUT')
                                    <div class="mb-3">
                                        <label for="" class="form-label">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" id="name" aria-describedby="helpId"
                                            placeholder="Please enter a name*" value="{{ $size->name, old('name') }}" />
                                        @error('name')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3 text-end">
                                        <button class="btn btn-sm btn-success"><i class="bi bi-arrow-clockwise"></i>
                                            Update</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
