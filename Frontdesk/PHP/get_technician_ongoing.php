<?php
include "../../connect_database.php";

header('Content-Type: application/json');

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
    GROUP BY
        u.csu_id;
";

$result_users = $conn->query($sql_technician_services);

if ($result_users === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

$data = array();

if ($result_users->num_rows > 0) {      
    while ($row = $result_users->fetch_assoc()) {
        $technician_names = $row["technician_names"];
        $ongoing_cases_count = $row["ongoing_cases_count"];
        $data[] = array("technician_names" => $technician_names, "ongoing_service_count" => $ongoing_cases_count);
    }
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

$conn->close();
?>
