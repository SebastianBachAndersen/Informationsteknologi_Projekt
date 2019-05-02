<?php


function signup(){
include_once('conn.php');

$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$age = $_POST['age'];
$class = $_POST['class'];
$total_modules = $_POST['total_modules'];
$error = null;
$error = checkPassword($password,$error);
    if(!$error){
        return var_dump($error);
    }else {
        
    try {
        $hashedpassword = md5($password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("CALL create_user(?,?,?,?,?,?,?);");
        $stmt->bind_param("ssssisi", $username, $hashedpassword, $firstname, $lastname, $age, $class, $total_modules);
    
        $stmt->execute();

        $stmt->bind_result($error);
        $stmt->fetch();
        
        return $error;
        
        $stmt->close();

        
        } 
    catch(Exception $e)
        {
            // Here you can filter on error messages and display a proper one.
            return "there was a mistake";
        }
    
    // prepare and bind



    }
}
function checkPassword($pwd, &$errors) {
    $errors_init = $errors;

    if (strlen($pwd) < 8) {
        $errors[] = "Password too short!";
    }

    if (!preg_match("#[0-9]+#", $pwd)) {
        $errors[] = "Password must include at least one number!";
    }

    if (!preg_match("#[a-zA-Z]+#", $pwd)) {
        $errors[] = "Password must include at least one letter!";
    }     

    return ($errors == $errors_init);
}

echo signup();


?>