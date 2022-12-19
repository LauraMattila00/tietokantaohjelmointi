<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$db = null;

$input = json_decode(file_get_contents('php://input'));
$asnimi = filter_var($input->asnimi, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$osoite = filter_var($input->osoite, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postinro = filter_var($input->postinro, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postitmp = filter_var($input->postitmp, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$puhnro = filter_var($input->puhnro, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$cart = $input->cart;

try {

    $db = openDb(); // Open database.
    $db->beginTransaction();

    // Insert customer.
    $sql = "INSERT INTO asiakas (asnimi, osoite, postinro, postitmp, puhnro) VALUES
    ('" .

    filter_var($asnimi,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
    filter_var($osoite,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
    filter_var($postinro,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
    filter_var($postitmp,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
    filter_var($puhnro,FILTER_SANITIZE_FULL_SPECIAL_CHARS)
    . "')";

    $asid = executeInsert($db,$sql);

    // Insert order.
    $sql = "INSERT INTO tilaus (asid) VALUES ($asid)";
    $tilausnro = executeInsert($db,$sql);

    // Insert order rows.
    foreach ($cart as $product) {

        $sql = "INSERT INTO tilausrivi (tilausnro,tuotenro) VALUES ("
    .
        $tilausnro . "," .
        $product->tuotenro   
    .   ")";
    executeInsert($db,$sql);

    }

    $db->commit(); // Commit transaction.
    // Return 200 status and customer id.
    header('HTTP/1.1 200 OK');
    $data = array('asid' => $asid);
    echo json_encode($data);
}    

catch (PDOException $pdoex) {
    $db->rollback(); // Error, rollback transaction.
    returnError($pdoex); // Returns error with 500 status and message.
    
    // echo($pdoex);

}

?>