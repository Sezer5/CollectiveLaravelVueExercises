<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddColorRequest;
use App\Http\Requests\UpdateColorRequest;
use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ColorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.color.index')->with([
            'colors' => Color::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.color.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AddColorRequest $request)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            Color::create($data);
            return redirect()->route('admin.color.index')->with([
                'success' => 'Color created successfully'
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
    public function edit(Color $color)
    {
        return view('admin.color.edit')->with([
            'color' => $color
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateColorRequest $request, Color $color)
    {
        if ($request->validated()) {
            $data = $request->validated();
            $data['slug'] = Str::slug($request->name);
            $color->update($data);
            return redirect()->route('admin.color.index')->with([
                'success' => 'Color updated successfully'
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Color $color)
    {
        $color->delete();
        return redirect()->route('admin.color.index')->with([
            'success' => 'Color deleted successfully'
        ]);
    }
}
