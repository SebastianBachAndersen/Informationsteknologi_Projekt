<?php 


function straf(){
    include_once("conn.php");
    $punishment = $_POST['punishment'];
    $user_id = $_POST['user_id'];
    $subject = $_POST['subject_id'];


    $stmt = $conn->prepare("INSERT INTO strafe (bruger_id, straf, subject_id) VALUES (?,?,?)"); 
    $stmt->bind_param("isi", $punishment, $user_id, $subject);

    $stmt->execute();
    $stmt->bind_result($error);
    return $error;

}

function removePunisment(){ 
    $user_id = $_POST['user_id'];

    $subject = $_POST['subject'];

    switch

    $stmt = $conn->prepare("DELETE FROM strafe WHERE bruger_id =? and subject = ?"); 
    $stmt->bind_param("is", $user_id,$subejct);
    $stmt->execute();

    


}

function printPunishment(){
    include_once("conn.php");
    $user_id = $_POST['user_id'];


    $stmt = $conn->prepare("SELECT straf,subject FROM getpunishmentdataonstudent WHERE bruger_id =?"); 
    $stmt->bind_param("i", $user_id);

    $stmt->execute();
    $printPunishmentData = array();
    $stmt->bind_result($punishmentData, $subjectdata);
    while ($stmt->fetch()) {
        $printPunishmentData[$subjectdata] = $punishmentData;
    }
    return print_r($printPunishmentData);

}

printPunishment();




?>