<?php 
    require_once '../inc/functions.php';
    require_once '../inc/headers.php';
    session_start();
    require_once ('./user_controller.php');


    $body = file_get_contents("php://input");
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
echo "Newuser" .$newuser->username."registered";







 /*   $username = strip_tags($newuser->username);*/





    /* lisää include('server.php')  */  

   /*<form method="post" action="register.php">
            <?php include('errors.php'); ?>

            <div class="input-group">
                <label>Username</label>
                <input type="text" name="username" value="<?php echo $username; ?>">
            </div>
            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" value="<?php echo $email; ?>">
            </div>
            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" value="<?php echo $password; ?>">
            </div>
            <div class="input-group">
                <label>Submit</label>
                <button type="submit" name="reg_user">Register</button>
            </div>

            <p>
                Already have <a href="login.php">loginhere</a>
            </p>

        </form>*/

  