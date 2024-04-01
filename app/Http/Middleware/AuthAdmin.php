<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {//start
        if(Auth::user()->utype==='ADM'){ //auth for admin changed when not worked case after stripe upgrations 
            return $next($request);
        }
        else{
            session()->flush();
            return redirect()->route('login');
        }//end
        return $next($request);
    }
}
