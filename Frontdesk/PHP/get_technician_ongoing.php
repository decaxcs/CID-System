<?php
include "../../connect_database.php";

header('Content-Type: application/json');

// Query to get all technicians with permission set to "Technician"
$sql_all_technicians = "
    SELECT
        u.csu_name AS technician_names,
        0 AS ongoing_cases_count
    FROM
        cs_users u
    WHERE
        u.csu_permission = 'Technician' AND u.isDeleted = 0;
";

$result_all_technicians = $conn->query($sql_all_technicians);

if ($result_all_technicians === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

// Fetch all technicians
$all_technicians = array();
if ($result_all_technicians->num_rows > 0) {
    while ($row = $result_all_technicians->fetch_assoc()) {
        $all_technicians[] = array(
            "technician_names" => $row["technician_names"],
            "ongoing_cases_count" => $row["ongoing_cases_count"]
        );
    }
}

// Query to get ongoing cases count for each technician
$sql_technician_services = "
    SELECT
        u.csu_name AS technician_names,
        COUNT(DISTINCT c.cid_number) AS ongoing_cases_count
    FROM
        cs_cid_information c
    LEFT JOIN
        cs_cid_technicians ct ON c.cid_number = ct.cid_number
    LEFT JOIN
        cs_users u ON ct.cid_technician_id = u.csu_id
    WHERE
        c.cid_status = 'On-going'
    AND
        u.csu_permission = 'Technician'
    AND
        u.isDeleted = 0
    GROUP BY
        u.csu_id;
";

$result_users = $conn->query($sql_technician_services);

if ($result_users === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

// Combine results of both queries
$data = array();
foreach ($all_technicians as $technician) {
    $found = false;
    if ($result_users->num_rows > 0) {
        while ($row = $result_users->fetch_assoc()) {
            if ($row["technician_names"] === $technician["technician_names"]) {
                $data[] = array(
                    "technician_names" => $row["technician_names"],
                    "ongoing_service_count" => $row["ongoing_cases_count"]
                );
                $found = true;
                break;
            }
        }
        $result_users->data_seek(0); // Reset the result pointer
    }
    if (!$found) {
        // If no ongoing cases for the technician, add with count 0
        $data[] = array(
            "technician_names" => $technician["technician_names"],
            "ongoing_service_count" => 0
        );
    }
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

$conn->close();
?>
