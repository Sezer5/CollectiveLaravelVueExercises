    @extends('layouts.adminlayout')
    @section('title')
        Color Add
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="card p-3">
                            <div class="card-header col-md-4 d-flex justify-content-between align-items-center">
                                <h3>Color Add</h3>
                            </div>
                            <div class="card-body col-md-4">
                                <form action="{{ route('admin.color.store') }}" method="post">
                                    @csrf
                                    <div class="mb-3">
                                        <label for="" class="form-label">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" id="name" aria-describedby="helpId"
                                            placeholder="Please enter a name*" value="{{ old('name') }}" />
                                        @error('name')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="mb-3 text-end">
                                        <button class="btn btn-sm btn-success"><i class="bi bi-plus"></i> Add</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    @endsection
