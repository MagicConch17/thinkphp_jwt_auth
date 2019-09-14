<?php

namespace app\Db\model;

use think\Model;

/**
 * @mixin think\Model
 */
class Persiness extends Model
{
    // 设置表名
    protected $table = 'persinesss';

    // 设置字段
    protected $schema = [
        'id' => 'int',
        'names' => 'varchar',
        'path' => 'varchar',
        'pid' => 'int',
    ];
}
