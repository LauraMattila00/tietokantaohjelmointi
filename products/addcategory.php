<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

try {
    if(isset($input)){
    $db = openDb();
    $sql = "insert into tuoteryhma (trnimi) values ('$name')";
    executeInsert($db, $sql);
    $data = array('trnro' => $db->lastInsertId(), 'trnimi' => $name);
    print json_encode($data);
    }
} catch (PDOException $pdoex) {
returnError($pdoex);
}