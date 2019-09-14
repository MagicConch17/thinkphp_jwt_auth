<?php

namespace app\Db\model;

use think\Model;

/**
 * @mixin think\Model
 */
class Roles extends Model
{
    // 设置表名
    protected $table = 'role';

    // 设置字段
    protected $schema = [
        'id' => 'int',
        'names' => 'varchar',
        'level' => 'int'
    ];
}
