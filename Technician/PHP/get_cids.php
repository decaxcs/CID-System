<?php
include "../../connect_database.php";

session_start();

header('Content-Type: application/json');

if (isset($_SESSION['csu_id']) && !empty($_SESSION['csu_id'])) {
    $user_id = $_SESSION['csu_id'];
} else {
    $response = array("status" => "error", "message" => "User is not logged in");
    echo json_encode($response);
    exit();
}

$type = $_GET['type'];


if ($type === "claimed") {
    $sql_cids = "SELECT 
                    cid.*, 
                    devices_type.cs_device_name AS service_name, 
                    DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                    GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                WHERE cid_tech.cid_technician_id = ? AND cid.isDeleted = 0
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_id DESC";
    $stmt = $conn->prepare($sql_cids);
    $stmt->bind_param("i", $user_id);
} else if ($type === "unclaimed") {
    $sql_cids = "SELECT 
                cid.*, 
                devices_type.cs_device_name AS service_name, 
                DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                WHERE cid_tech.cid_technician_id IS NULL OR cid_tech.cid_technician_id = '' AND  cid.isDeleted = 0
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_id DESC";
    $stmt = $conn->prepare($sql_cids);
    $stmt->execute();
} else if ($type === "recent-claimed") {
    $sql_cids = "SELECT 
                cid.*, 
                devices_type.cs_device_name AS service_name, 
                DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                WHERE cid_tech.cid_technician_id = ? AND cid.cid_created >= DATE_SUB(NOW(), INTERVAL 7 DAY)  AND cid.isDeleted = 0
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_id DESC";
    $stmt = $conn->prepare($sql_cids);
    $stmt->bind_param("i", $user_id);
} else if ($type === "status") {
    $tableStatus = $_GET['tableStatus'];
    $sql_cids = "SELECT 
                cid.*, 
                devices_type.cs_device_name AS service_name, 
                DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                WHERE cid_tech.cid_technician_id = ? AND cid.isDeleted = 0 AND cid.cid_status = '$tableStatus'
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_id DESC";
    $stmt = $conn->prepare($sql_cids);
    $stmt->bind_param("i", $user_id);
} else {
    $response = array("status" => "error", "message" => "Invalid type");
    echo json_encode($response);
    exit();
}

// Execute the prepared statement
$stmt->execute();
$result_cids = $stmt->get_result();

if ($result_cids === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

$data = array();

if ($result_cids->num_rows > 0) {
    while ($row = $result_cids->fetch_assoc()) {
        $data[] = $row;
    }
}

$response = array("status" => "success", "cids_data" => $data);

echo json_encode($response);

// Close statement and connection
$stmt->close();
$conn->close();
