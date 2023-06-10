<?php
if(true){
    require_once('dbacess.php');

    $sql = "SELECT * FROM produkte WHERE k_id LIKE CONCAT('%', ?, '%')";
    $statment = $db->prepare($sql);
    $statment->bind_param("s", $param);
    $statment->execute();
    $res = $statment->get_result();
    $statment->close();
    $db->close();
}