<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$sql = "SELECT cid_number FROM cs_cid_information ORDER BY cid_created DESC LIMIT 1";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $cid_number = $row["cid_number"];
    $response = array("status" => "success", "cid_number" => $cid_number);
    echo json_encode($response);
} else {
    $response = array("status" => "error", "message" => "No results found");
    echo json_encode($response);
}

$conn->close();
?>
