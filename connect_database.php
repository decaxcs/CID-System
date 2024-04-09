<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cid_system";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
mysqli_query($conn, "SET time_zone = '+08:00'");

$conn->set_charset("utf8mb4");

date_default_timezone_set('Asia/Manila');
?>