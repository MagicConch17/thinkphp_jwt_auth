<?php

namespace app\Db\model;

use think\Model;

/**
 * @mixin think\Model
 */
class Users extends Model
{
    // 设置表名
    protected $table = 'users';

    // 设置字段信息
    protected $schema = [
        'id' => 'int',
        'names' => 'varchar',
        'sex' => 'int',
        'password' => 'varchar',
        'api_token' => 'text'
    ];


}
