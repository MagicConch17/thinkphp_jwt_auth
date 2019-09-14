<?php

namespace app\middleware;

class Rbac
{
    public function handle($request, \Closure $next, $path)
    {
        dd($path);
    }
}
