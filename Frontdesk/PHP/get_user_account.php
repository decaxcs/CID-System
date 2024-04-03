<?php
include "../../connect_database.php";

session_start();

header('Content-Type: application/json');

if (isset($_SESSION['csu_id'])) {
    $csu_id = $_SESSION['csu_id'];

    $sql = "SELECT csu_name FROM cs_users WHERE csu_id = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $csu_id);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $csu_name = $row["csu_name"];

        $response = array("status" => "success", "csu_name" => $csu_name);

        echo json_encode($response);
    } else {
        $response = array("status" => "error", "message" => "No results found");
        echo json_encode($response);
    }
} else {
    $response = array("status" => "error", "message" => "csu_id not found in session");
    echo json_encode($response);
}

$conn->close();
?>
