    @extends('layouts.adminlayout')
    @section('title')
        Size Add
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card border border-2">
                            <div class="card-header">
                                <h3>Size Add</h3>
                            </div>
                            <div class="card-body">
                                <div class="col-md-4">
                                    <form action="{{ route('admin.size.store') }}" method="post">
                                        @csrf
                                        <div class="mb-3">
                                            <label for="" class="form-label">Name</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" id="name" aria-describedby="helpId"
                                                placeholder="Please enter a name*" value="{{ old('name') }}" />
                                            @error('name')
                                                <span class="invalid-feedback">
                                                    {{ $message }}
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="mb-3 text-end">
                                            <button class="btn btn-success btn-sm"><i class="bi bi-plus"></i> Add</button>
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
