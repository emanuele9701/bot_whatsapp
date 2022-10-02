<?php

namespace App\Http\Middleware;

use App\Models\MyLog;
use Closure;
use Illuminate\Http\Request;

class LogRoute
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request);
        
        $log = new MyLog();
        $log->request = $request->getUri();
        $log->body = $request->all();
        $log->ip_from = $request->ip();
        $log->save();
        
        return $response;
    }
}
