<?php
include "../../connect_database.php";

header('Content-Type: application/json');

// Array to hold the status types
$statusTypes = array("Release", "Warranty", "On-going");

$data = array();

foreach ($statusTypes as $statusType) {
    // Prepare the SQL query
    $sql_status = "
        SELECT 
            COUNT(*) AS count
        FROM 
            cs_cid_information
        WHERE
            cid_status = '$statusType';
    ";

    $result_status = $conn->query($sql_status);

    if ($result_status === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }

    // Fetch the count and store it in the data array
    $row = $result_status->fetch_assoc();
    $count = $row["count"];
    $data[$statusType] = $count;
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

$conn->close();
?>
