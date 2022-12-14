<?php










/*if(count($error) >0) : ?>
    <div class="error">
        <?php foreach ($errors as $error): ?>
            <p><?php echo $error ?></p>
            <?php endforeach ?>

    </div>
    <?php endif ?>*/





/*require_once '../inc/functions.php';
require_once '../inc/headers.php';

session_start();

$host = $ini['host'];
  $database = $ini['database'];
  $user = $ini['user'];
  $password = $ini['password'];
  $db = new PDO("mysql:host=$host;dbname=$database;charset=utf8",$user,$password);
  $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
  return $db;

/*$username = "";
$email = "";
$password="";
$errors = array();*/

/*$db = mysqli_connect("mysql:host=$host;dbname=$database;charset=utf8",$user,$password);


if (isset($_POST['reg_user'])) {
    $username = mysqli_real_escape_string($db, $_POST["username"]);
    $email = mysqli_real_escape_string($db, $_POST["email"]);
    $password = mysqli_real_escape_string($db, $_POST["password"]);

 if(empty($username)) {array_push($errors, "Username is required");}
if(empty($email)) {array_push($errors, "email is required");}
if(empty($password)) {array_push($errors, "password is required");}

}

// check 1st

$user_check_query = "SELECT * FROM newuser WHERE username='$username' OR email='$email' LIMIT 1";
$result = mysqli_query($db, $user_check_query);
$user = mysqli_fetch_assoc($result);

if(count($errors)==0){
    $password = $password;
    $query= "INSERT INTO newuser (username, email, password)
            VALUES ('$username', '$email', '$password')";

mysqli_query($db, $query);
$_SESSION['username'] = $username;
$_SESSION['success']= "Logged in";
header('location: headers.php');
}

// login

if (isset($_POST['login_user'])) {
    $username = mysqli_real_escape_string($db, $_POST["username"]);
    $password = mysqli_real_escape_string($db, $_POST["password"]);
}

*/