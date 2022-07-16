<?php 

include __DIR__."/load.php";

$tbImg = new Table($conn,"media_from_message");
$c = $tbImg->select("where stream <> '' order by media_id desc limit 3");
// var_dump($c);die;
echo '<img src="data:image/jpeg;base64,'.base64_encode($c[0]['stream']).'"/>';
