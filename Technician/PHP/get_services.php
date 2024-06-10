<?php
include "../../connect_database.php";

session_start();
header('Content-Type: application/json');

// Assuming $cid_number is defined somewhere in your code
$cid_number = $_GET['cid_number']; // Adjust this according to your session variable

// Fetch services not in the summary of repairs
$sql_services_not_in_summary = "SELECT *
                                FROM cs_services
                                WHERE cs_service_id NOT IN (
                                    SELECT DISTINCT cid_service_id
                                    FROM cid_summary_of_payments
                                    WHERE cid_number = ?
                                ) AND isDeleted = 0";
$sql_services_not_in_summary = $conn->prepare($sql_services_not_in_summary);
$sql_services_not_in_summary->bind_param("s", $cid_number);
$sql_services_not_in_summary->execute();
$result_services_not_in_summary = $sql_services_not_in_summary->get_result();

// Fetch available technicians
$sql_users = "SELECT csu_id, csu_username, csu_name
            FROM cs_users
            LEFT JOIN cs_cid_technicians ON cs_users.csu_id = cs_cid_technicians.cid_technician_id AND cs_cid_technicians.cid_number = ?
            WHERE isDeleted = 0 AND cs_cid_technicians.cid_number IS NULL";
$sql_users = $conn->prepare($sql_users);
$sql_users->bind_param("s", $cid_number);
$sql_users->execute();
$result_users = $sql_users->get_result();

$data = array();
$services_not_in_summary = array();

if ($result_users === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}   

if ($result_services_not_in_summary->num_rows > 0) {
    while ($row = $result_services_not_in_summary->fetch_assoc()) {
        $service_id = $row["cs_service_id"];
        $service_name = $row["cs_service_name"];
        $services_not_in_summary[] = array("service_id" => $service_id, "service_name" => $service_name);
    }
}

if ($result_users->num_rows > 0) {
    while ($row = $result_users->fetch_assoc()) {
        $csu_id = $row["csu_id"];
        $csu_name = $row["csu_name"];
        $data[] = array("csu_id" => $csu_id, "csu_name" => $csu_name);
    }
}

$response = array("status" => "success", "data" => $data, "services_not_in_summary" => $services_not_in_summary);

echo json_encode($response);

$conn->close();
?>
