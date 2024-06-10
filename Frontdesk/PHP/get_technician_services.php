<?php
include "../../connect_database.php";

header('Content-Type: application/json');

// Query to fetch users
$sql_users = "SELECT csu_id, csu_name FROM cs_users WHERE isDeleted = 0";
$result_users = $conn->query($sql_users);

if ($result_users === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

// Query to fetch services
$sql_services = "SELECT cs_service_id, cs_service_name FROM cs_services WHERE isDeleted = 0";
$result_services = $conn->query($sql_services);

if ($result_services === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

// Query to fetch devices
$sql_devices = "SELECT cs_device_id, cs_device_name FROM cs_devices WHERE isDeleted = 0";
$result_devices = $conn->query($sql_devices);

if ($result_devices === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

// Query to fetch devices
$sql_sources = "SELECT cs_source_id, cs_source_name FROM cs_sources WHERE isDeleted = 0";
$result_sources = $conn->query($sql_sources);

if ($result_sources === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}


$users_data = array();
$services_data = array();
$devices_data = array();
$sources_data = array();

if ($result_users->num_rows > 0) {
    while ($row = $result_users->fetch_assoc()) {
        $csu_id = $row["csu_id"];
        $csu_name = $row["csu_name"];
        $users_data[] = array("csu_id" => $csu_id, "csu_name" => $csu_name);
    }
}

if ($result_services->num_rows > 0) {
    while ($row = $result_services->fetch_assoc()) {
        $cs_service_id = $row["cs_service_id"];
        $cs_service_name = $row["cs_service_name"];
        $services_data[] = array("cs_service_id" => $cs_service_id, "cs_service_name" => $cs_service_name);
    }
}

if ($result_devices->num_rows > 0) {
    while ($row = $result_devices->fetch_assoc()) {
        $cs_device_id = $row["cs_device_id"];
        $cs_device_name = $row["cs_device_name"];
        $devices_data[] = array("cs_device_id" => $cs_device_id, "cs_device_name" => $cs_device_name);
    }
}

if ($result_sources->num_rows > 0) {
    while ($row = $result_sources->fetch_assoc()) {
        $cs_source_id = $row["cs_source_id"];
        $cs_source_name = $row["cs_source_name"];
        $sources_data[] = array("cs_source_id" => $cs_source_id, "cs_source_name" => $cs_source_name);
    }
}

$response = array("status" => "success", "users_data" => $users_data, "services_data" => $services_data, "devices_data" => $devices_data, "sources_data" => $sources_data);

echo json_encode($response);

$conn->close();
?>
