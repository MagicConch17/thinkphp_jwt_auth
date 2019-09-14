<?php

namespace app\controller;

use app\Request;
use app\BaseController;
use app\Db\model\Users;
use thans\jwt\facade\JWTAuth;
use think\exception\HttpException;
use think\facade\Cache;

class Login extends BaseController
{

    /**
     * 获取验证码
     */
    public function getCode()
    {
        $code = mt_rand(1000, 9999);
        $name = md5('login_'.$code);
        Cache::set($name, $code, 120);// 设置验证码时间为 2分钟
        return $this->responseText(200, "OK", [
           'key' => $name,
           'code' => $code
        ]);
    }
    /**
     * 用户登录控制器
     */
    public function logins(Request $request, Users $users)
    {
        if (!$request->post('name') || !$request->post('password')){
            throw new HttpException(403, "缺少必要参数");
        }

        if (!$code = Cache::get($request->post('key'))){
            throw new HttpException(403, "验证码错误,或者失效");
        }

        if(!$request->post('code') == $code){
            throw new HttpException(403, "验证码错误,或者失效");
        }

        $user = $users->where([
            'names' => $request->post('name'),
            'password' => md5($request->post('password'))
        ])->find();

        if (empty($user)){
            throw new HttpException(403, "用户名或者密码错误");
        }

        // 数据库能查询到该用户 那么 进行 jwt
         $token = JWTAuth::builder($user->hidden(['api_token'])->toArray());

        $user->api_token = $token;
        if (!$bool = $user->save()){
            throw new HttpException(403, "更新失败");
        }

        return $this->responseText(200, "OK", ['token' => $token]);

    }

    /**
     * 注册用户
     * 需要提供账号 name
     * 需要提供密码 password
     */
    public function register(Request $request, Users $users)
    {
        if (!$request->has('name','post')){
            throw new HttpException(403, "账号是必须的");
        }
        if (!$request->has('password','post')){
            throw new HttpException(403, "密码是必须的");
        }
        // 暂时不对长度进行限制 可扩展
        $data = [];
        $data['names'] = $request->post('name');
        $data['password'] = md5($request->post('password'));
        $data['sex'] = 1;// 默认为男性
        if ($user = $users->where('names', $request->post('name'))->find()) {
            throw new HttpException(403, "该账户已存在,请前往登录");
        }
        if (!$bool = $users->create($data)) {
            throw new HttpException(500, "数据库异常");
        }
        return $this->responseText();
    }

}