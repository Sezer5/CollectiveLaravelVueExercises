<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next, string $role)
    { {
            // Kullanıcı giriş yapmamışsa veya belirtilen role sahip değilse erişimi engelle
            if (! $request->user() || ! $request->user()->roles->contains('name', $role)) {
                return response()->json([
                    'message' => 'Bu işleme erişim yetkiniz bulunmamaktadır.'
                ], Response::HTTP_FORBIDDEN); // 403 Hata Kodu
            }

            return $next($request);
        }
    }
}
