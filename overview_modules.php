<?php 


function showallmoduels(){
    include_once("conn.php");
    $user_id = $_POST['user_id'];



    $stmt = $conn->prepare("SELECT attendance, TIMESTAMP, subjects  FROM moduler WHERE bruger_id = ?"); 
    $stmt->bind_param("i", $user_id);
    $stmt->execute();

    $printdata = array();
    $stmt->bind_result($attendance, $time, $subjects);
    while ($stmt->fetch()) {
        $internalArray = array();
        array_push($internalArray,$attendance); 
        array_push($internalArray,$time); 
        array_push($internalArray,$subjects); 

        array_push($printdata,$internalArray); 
    }
    return json_encode($printdata);


}
print_r(showallmoduels());




?>