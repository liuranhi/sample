<?php

// 配列を宣言・初期化
$datas = array(100, 51, 22, 65);

shuffle($datas);

foreach ($datas as $data) {
    echo "$data \n";
}

?>
