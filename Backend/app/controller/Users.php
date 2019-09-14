<?php


namespace app\controller;

use app\BaseController;
use app\Request;
use thans\jwt\facade\JWTAuth;

class Users extends BaseController
{
    /**
     * 获取会员的个人信息
     */
    public function index(Request $request)
    {
        $user = JWTAuth::auth();
        return $this->responseText(200, "Ok", $user);
    }
}