<?php

namespace app\Db\model;

use think\Model;

/**
 * @mixin think\Model
 */
class UserRoles extends Model
{
    // 设置表名
    protected $table = 'user_roles';
    // 设置字段
    protected $schema = [
        'user_id' => 'int',
        'role_id' => 'int'
    ];
}
