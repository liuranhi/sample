<?php


// クラス定義
class Fubuki{
  // メンバ変数(インスタンス変数)
  public $name = "艦名";
  public $arm1 = "装備1";
  public $arm2 = "装備2";
  // コンストラクタ
  function printName(){
    print "$this->name";
  }

}

// インスタンス生成(1番艦吹雪)
$fubuki = new Fubuki();

// 表示
$fubuki->printName(); // 艦名
