<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    require_once ('./user_controller.php');

    if(isset($_SESSION['username'])){
        http_response_code('200');
        echo $_SESSION['username'];
        return;
    }

    if(!isset($_POST['username']) || !isset($_POST['email']) | !isset($_POST['password'])){
        http_response_code(401);
        echo "User not defined.(==)";
        return;
    }

    $username = $_POST['username'];
    $email = $_POST['email'];
    $post =$_POST['password'];
    

    $verified_username =checkNewuser($username,$email,$password);

    if($verified_username){
        $_SESSION["username"] = $verified_username;
        http_response_code(200);
        echo $verified_username;
    }else{
        http_response_code(401);
        echo "Wrong user";
    }