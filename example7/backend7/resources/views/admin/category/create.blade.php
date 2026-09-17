    @extends('layouts.adminlayout')
    @section('title')
        Category Create
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Category Create</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <form action="{{ route('admin.category.store') }}" method="post">
                                @csrf
                                <div class="mb-3">
                                    <label for="" class="form-label">Name</label>
                                    <input type="text" class="form-control @error('name') is-invalid @enderror"
                                        name="name" id="name" aria-describedby="helpId"
                                        placeholder="Please enter name*" value="{{ old('name') }}" />
                                    @error('name')
                                        <span class="invalid-feedback">
                                            {{ $message }}
                                        </span>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <button class="btn btn-success btn-sm" type="submit">
                                        Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    @endsection
