<?php 
    /*
    $body = file_get_contents('php://input');
    $newuser = json_decode($body);

    if(!isset($newuser->username) || !isset($newuser->email)|| !isset($newuser->password)){
        http_response_code("400");
        echo "User not defined.";
        return;

    }

registerUser($newuser->username,$newuser->email ,$newuser->password);

$_SESSION['username'] = $newuser->username;
$_SESSION['email'] = $newuser->email;
$_SESSION['password'] = $newuser->password;

http_response_code('200');
echo "Newuser" .$newuser->username."registered";*/

require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    require_once ('./user_controller.php');
    

$postdata = file_get_contents("php://input");
$db = openDb();


if(isset($postdata) && !empty($postdata)){
    $request = json_decode($postdata);
     
     
    $username = $request->username;
    $email = $request->email;
    $password = $request->password;
    $hashedpassword = password_hash($password, PASSWORD_DEFAULT);
    $sql = "INSERT INTO newuser(username,email,pw) VALUES ('$username','$email','$hashedpassword')";

    if(executeInsert($db,$sql)){
        http_response_code(201);
    }
    else{
         http_response_code(422); 
    }
         
}

  