<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;
use thans\jwt\middleware\JWTAuth;

Route::get('think', function () {
    return 'hello,ThinkPHP6!';
});

Route::get('hello/:name', 'index/hello');

// 获取验证码
Route::get('code','login/getCode')->allowCrossDomain();
// 登录
Route::post('logins/user','login/logins')->allowCrossDomain();
// 注册
Route::post('register/user','login/register')->allowCrossDomain();
// 获取个人信息
Route::get('users/index','users/index')->middleware(JWTAuth::class)->allowCrossDomain();