<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthAdminRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{

    public function index()
    {
        return view('admin.index');
    }

    public function login()
    {
        return view('admin.login');
    }

    public function auth(AuthAdminRequest $request)
    {
        if ($request->validated()) {
            $credentials = $request->validated();
        }

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
        }

        if (Auth::user() && Auth::user()->hasRole('admin')) {
            return redirect()->route('admin.index')->with([
                'success' => 'User logged in successfully'
            ]);
        } else {
            Auth::logout();
            return redirect()->route('admin.login')->with([
                'success' => 'Something went wrong!'
            ]);
        }
    }

    public function logout()
    {
        Auth::user()->logout();
        return redirect()->route('admin.login');
    }
}
