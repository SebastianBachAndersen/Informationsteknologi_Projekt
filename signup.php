<?php
include_once 'conn.php';

function signup(){
$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['fristname'];
$lastname = $_POST['lastname'];
$age = $_POST['age'];
$class = $_POST['class'];
$total_modules = $_POST['total_modules'];

$error = checkPassword($password);
    if($error){
        return $error;
    }else {
        
    // prepare and bind
    $stmt = $conn->prepare("INSERT INTO bruger (fornavn, efternavn, alder,klasse ,totalmoduler) VALUES (?, ?, ?,?,?)");
    $stmt->bind_param("ssisi", $firstname, $lastname, $age, $class, $total_modules);

    $stmt->execute();
    $stmt->close();
    try{
        $stmt = $conn->prepare("INSERT INTO login (brugernavn ,password) VALUES (?,?)");
        $stmt->bind_param("ss", $username, password_hash($password, PASSWORD_DEFAULT));
        
        $stmt->execute();

        $stmt->close();
    } catch(Exception $e){
        return $e->getMessage();
    }

    



    }





}
public function checkPassword($pwd, &$errors) {
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

?>