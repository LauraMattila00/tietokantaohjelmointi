<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    require_once ('./user_controller.php');

    /*if(isset($_SESSION['username'])){
        http_response_code('200');
        echo $_SESSION['username'];
        return;
    }*/

    $postdata = file_get_contents("php://input");
$db = openDb();


// if(isset($postdata) && !empty($postdata)){
    $request = json_decode($postdata);
     
     
    $username = $request->username;
    $email = $request->email;
    $password = $request->password;
  
    $sql = "SELECT password FROM newuser WHERE username= '$username'"; 
   
    $query = $db->query($sql);
    $result = $query->fetchAll(PDO::FETCH_ASSOC);
   
    if($result[0]["password"] == $password){

        $_SESSION['username'] = $username;
        echo $username; 
    }
    else {
        echo json_encode("Login Failed");
    }  
   
// }


 /*   if(!isset($_POST['username']) || !isset($_POST['email']) ||!isset($_POST['password'])){
        http_response_code(400);
        echo "User not defined:=(";
        print_r($_POST);
        return;
    }

    $username = $_POST['username'];
    $email = $_POST['email'];
    $password =$_POST['password'];
    

  $verified_username =checkNewuser($username,$email,$password);

    if($verified_username){
        $_SESSION["username"] = $verified_username;
        http_response_code(200);
        echo $verified_username;
    }else{
        http_response_code(401);
        echo "Wrong user";
    }*/