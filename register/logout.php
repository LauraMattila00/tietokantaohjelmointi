<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    session_destroy();
    unset($SESSION["username"]);

    http_response_code(200);
    echo "Logged out";
    
