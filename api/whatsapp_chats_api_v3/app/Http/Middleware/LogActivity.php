<?php

namespace App\Http\Middleware;

use App\Models\MyLog;
use Closure;
use Illuminate\Http\Request;

class LogActivity
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

        $log = new MyLog();
        $log->request = str_replace(getenv("APP_URL"),"",$request->url());
        // $log->body = json_encode(base64_decode($request->input()));
        $log->ip_from = $request->ip();
        $log->save();

        return $next($request);
    }
}
