<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$sql_technician_services = "
    SELECT
        u.csu_id AS technician_id,
        u.csu_name AS technician_name,
        COUNT(c.cid_id) AS ongoing_cases_count
    FROM
        cs_cid_information c
    JOIN
        cs_users u ON c.cid_technician_id = u.csu_id
    WHERE
        c.cid_status = 'On-going'
    GROUP BY
        u.csu_id, u.csu_name;
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
        $technician_id = $row["technician_id"];
        $technician_name = $row["technician_name"];
        $ongoing_cases_count = $row["ongoing_cases_count"];
        $data[] = array("technician_id" => $technician_id, "technician_name" => $technician_name, "ongoing_service_count" => $ongoing_cases_count);
    }
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

$conn->close();
?>
