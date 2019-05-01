<?php 
function login(){
    include_once "conn.php";
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    if($username == "" || $password == ""){
        return "brugernavn eller password mangler";
    }else {
        
        $hash = password_hash($password, PASSWORD_DEFAULT);
        
        // prepare and bind
        $stmt = $conn->prepare("SELECT  bruger_id FROM login WHERE username = ? AND PASSWORD =?");

        $stmt->bind_param("ss", $username, $hash);
        $stmt->execute();
        $stmt->bind_result($user_id);
        $stmt->fetch();
        $stmt->close();
        $conn->close();

        if ($user_id == "" || $user_id == null ){
            return "password or username not correcet try agian";
        }
        else {
            return $user_id;
        }


    }
    
}

login();


?>