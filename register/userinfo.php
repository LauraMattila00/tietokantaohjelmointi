<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    require_once ('./user_controller.php');

    if(!isset($_SESSION['username'])){
        http_response_code(403);
        echo "No access for user data";
        return;
    }

    /*$messages = getUserMessages($_SESSION)['username']);
    $result = array();
    $result['messages'] = $messages;
    {
        "message": [""]
    }

    $json = json_encode($message);
    header('Content-type: application/json');
    echo $json;*/