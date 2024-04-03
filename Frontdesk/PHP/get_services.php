<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$sql_services = "
    SELECT
        s.cs_service_id AS service_id,
        s.cs_service_name AS service_name,
        COUNT(c.cid_number) AS cid_count
    FROM
        cs_services s
    LEFT JOIN
        cs_cid_information c ON s.cs_service_id = c.cid_service_id
    GROUP BY
        s.cs_service_id, s.cs_service_name, c.cid_type;
";

$result_services = $conn->query($sql_services);

if ($result_services === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

$data = array();

if ($result_services->num_rows > 0) {      
    while ($row = $result_services->fetch_assoc()) {
        $service_id = $row["service_id"];
        $service_name = $row["service_name"];
        $cid_count = $row["cid_count"];
        $data[] = array("service_id" => $service_id, "service_name" => $service_name, "cid_count" => $cid_count);
    }
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

$conn->close();
?>
