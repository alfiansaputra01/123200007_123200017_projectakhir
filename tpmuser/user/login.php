<?php
include '../conn.php';


$username = $_POST['username'];
$password = md5($_POST['password']);

$sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

$result = $connect -> query($sql);

if($result->num_rows > 0){

    $userRecord = array();
    while($rowFound = $result->fetch_assoc()){
        $userRecord[] = $rowFound;
    }

    echo json_encode(array(
        "success" => true,
        "userData" => $userRecord[0],
    )
    );

}else{

    echo json_encode(array("success"=>false));

}
