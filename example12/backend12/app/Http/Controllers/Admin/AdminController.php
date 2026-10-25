<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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
            if (Auth::attempt($credentials)) {
                $request->session()->regenerate();
            }

            if (Auth::check() && Auth::user()->hasRole('admin')) {
                return redirect()->route('admin.index');
            } else {
                Auth::logout();
                return redirect()->route('admin.login');
            }
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('admin.login');
    }
}
