<?php
include '../conn.php';


$username = $_POST['username'];
$password = md5($_POST['password']);

$sql = "INSERT INTO user SET username = '$username', password = '$password'";

$result = $connect -> query($sql);

if($result){

    echo json_encode(array("success"=>true));

}else{

    echo json_encode(array("success"=>false));

}
