    @extends('layouts.adminlayout')
    @section('title')
        Color Edit
    @endsection
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3>Color Edit</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-md-4">
                            <form action="{{ route('admin.color.update', $color->slug) }}" method="post">
                                @csrf
                                @method('PUT')
                                <div class="mb-3">
                                    <label for="" class="form-label">Name</label>
                                    <input type="text" class="form-control @error('name') is-invalid @enderror"
                                        name="name" id="name" aria-describedby="helpId"
                                        placeholder="Please enter name*" value="{{ $color->name, old('name') }}" />
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
