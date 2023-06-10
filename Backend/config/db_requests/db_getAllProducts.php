<?php
if(true){
    require_once('dbacess.php');

    $sql = "SELECT * FROM produkte";
    $res = $db->query($sql);
    $db->close();
} 