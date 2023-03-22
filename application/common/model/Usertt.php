<?php

namespace app\common\model;

use think\Db;
use think\Model;

/**
 * 会员模型
 */
class Usertt extends Model
{

    protected $name = 'IMUser';

    public static $trueTableName = 'IMUser';
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
 
    protected $createTime = 'created';
    protected $updateTime = 'updated';

    

    public static function mGetByUsername($value)
    {
        return Db::table(self::$trueTableName)->where('name',$value)->find();
    }

    public static function mGetByUserId($value)
    {
        return Db::table(self::$trueTableName)->where('id',$value)->find();
    }

}
