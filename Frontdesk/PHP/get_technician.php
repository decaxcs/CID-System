<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$sql = "SELECT csu_id, csu_name FROM cs_users";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $csu_id = $row["csu_id"];
        $csu_name = $row["csu_name"];
        $data[] = array("csu_id" => $csu_id, "csu_name" => $csu_name);
    }
    $response = array("status" => "success", "data" => $data);
    echo json_encode($response);
} else {
    $response = array("status" => "error", "message" => "No results found");
    echo json_encode($response);
}

$conn->close();
?>
