<?php
include "../../connect_database.php";

session_start();
header('Content-Type: application/json');

$technician = $_SESSION['csu_id'];
$cid_number = $_POST['cid_number'];     

$sql_users = "SELECT csu_id, csu_username, csu_name
            FROM cs_users
            LEFT JOIN cs_cid_technicians ON cs_users.csu_id = cs_cid_technicians.cid_technician_id AND cs_cid_technicians.cid_number = '$cid_number'
            WHERE isDeleted = 0 AND cs_cid_technicians.cid_number IS NULL";
        
$result_users = $conn->query($sql_users);

if ($result_users === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}   

$sql_service = "SELECT * FROM cs_cid_information WHERE cid_number = ?";
$sql_service = $conn->prepare($sql_service);
$sql_service->bind_param("s", $cid_number);
$sql_service->execute();
$result_service = $sql_service->get_result();

$service_data = $result_service->fetch_all(MYSQLI_ASSOC);
$data = array();

if ($result_users->num_rows > 0) {
    while ($row = $result_users->fetch_assoc()) {
        $csu_id = $row["csu_id"];
        $csu_name = $row["csu_name"];
        $data[] = array("csu_id" => $csu_id, "csu_name" => $csu_name);
    }
}

$response = array("status" => "success", "data" => $data , "service_data" => $service_data);

echo json_encode($response);

$conn->close();
?>
