<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
   
// Add new user
    function registerUser($username,$email,$password){
        $db = openDb();
     

        $sql ="INSERT INTO newuser(username,email, pw) VALUES(?,?,?)";
        $statement =$db->prepare($sql);
        $statement->execute(array($username,$email, $password));
    }

    // check credentials and return username , authenticarion nor 0

    function checkNewuser($username, $password){
        $db = openDb();

        $sql ="SELECT pw FROM newuser WHERE username=?";
        $statement =$db->prepare($sql);
        $statement->execute(array($username));

      $hashedpw = $statement->fetchColumn();
        if(isset($hashedpw)){
           return password_verify($password, $hashedpw) ? $username : null;
        }
        return null;
    }



    

    // may be personal message for user?


/*function getUserMessage($username){
    $db = openDb();
    $sql ="SELECT msg FROM message WHERE username=?";
    $statement=$db->prepare($sql);
    $statement->execute(array($username));

    return $statement->fetchAll(PDO::FETCH_COLUMN, 0);
    

}*/
