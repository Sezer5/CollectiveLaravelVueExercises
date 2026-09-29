<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddSizeRequest;
use App\Http\Requests\UpdateSizeRequest;
use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SizeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.size.index')->with([
            'sizes' => Size::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.size.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AddSizeRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            Size::create($data);
            return redirect()->route('admin.size.index')->with([
                'success' => 'Size created successfully'
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        abort(403);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Size $size)
    {
        return view('admin.size.edit')->with([
            'size' => $size
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSizeRequest $request, Size $size)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            $size->update($data);
            return redirect()->route('admin.size.index')->with([
                'success' => 'Size updated successfully'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Size $size)
    {
        $size->delete();
        return redirect()->route('admin.size.index')->with([
            'success' => 'Size deleted successfully'
        ]);
    }
}
