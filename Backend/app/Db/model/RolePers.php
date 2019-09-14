<?php

namespace app\Db\model;

use think\Model;

/**
 * @mixin think\Model
 */
class RolePers extends Model
{
    // 设置表名
    protected $table = 'role_pers';
    // 设置字段
    protected $schema = [
        'role_id' => 'int',
        'pers_id' => 'int'
    ];
}
