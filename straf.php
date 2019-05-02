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
    // return data som int 1 = dansk,2 = matematik,3=kemi,4 = fysik,5 =  informationsteknologi
    $subject = $_POST['subject'];

    

    $stmt = $conn->prepare("DELETE FROM strafe WHERE bruger_id =? and subject = ?"); 
    $stmt->bind_param("is", $user_id,$subejct);
    $stmt->execute();

    return "datadeleted";

    


}
function update(){
    $user_id = $_POST['user_id'];
    // return data som int 1 = dansk,2 = matematik,3=kemi,4 = fysik,5 =  informationsteknologi
    $subject_id = $_POST['subject'];
    $new_punishment = $_POST['new_straf'];
    
    $stmt = $conn->prepare("UPDATE strafe SET 
    straf = ? 
	 WHERE bruger_id = ? 
	 AND subject_id = ?;
   "); 
    $stmt->bind_param("sii", $new_punishment,$user_id, $subject_id);
    $stmt->execute();

    return "update sucsessfull";
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