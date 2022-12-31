<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

if(!isset($_SESSION["username"])){
    http_response_code(403);
    echo "Ei käyttöoikeutta!";
} else {

    $input = json_decode(file_get_contents('php://input'));
    $name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    try {
        if(isset($name)){
            $db = openDb();
            $sql = "insert into tuoteryhma (trnimi) values ('$name')";
            executeInsert($db, $sql);
            $data = array('trnro' => $db->lastInsertId(), 'trnimi' => $name);
            print json_encode($data);
        } 
    } catch (PDOException $pdoex) {
    returnError($pdoex);
    }
}