    @extends('layouts.adminlayout')
    @section('content')
        <main class="p-4">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 card mb-4">
                        <h3>Create</h3>
                        <hr>
                        <div class="col-md-4 my-4">
                            <form action="{{ route('admin.category.store') }}" method="post">
                                @csrf
                                <div class="mb-3">
                                    <label for="" class="form-label">Name*</label>
                                    <input type="text" class="form-control" name="name" id="name"
                                        aria-describedby="helpId" placeholder="Please enter a name*"
                                        value="{{ old('name') }}" />

                                </div>
                                <div class="mb-3 text-end">
                                    <button class="btn btn-success" type="submit">
                                        <i class="bi bi-plus"></i> Add
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </main>
    @endsection
