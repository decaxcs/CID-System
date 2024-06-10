<?php
include "../../connect_database.php";

header('Content-Type: application/json');

// Array to hold the status types
$statusTypes = array("For Release", "On-going Warranty", "On-going");

$data = array();

// Prepare the SQL query outside the loop
$sql_status = "
    SELECT 
        cid_status,
        COUNT(*) AS count
    FROM 
        cs_cid_information
    WHERE
        cid_status = ? AND isDeleted = 0
";

$stmt = $conn->prepare($sql_status);

if ($stmt === false) {
    $response = array("status" => "error", "message" => "Error preparing statement: " . $conn->error);
    echo json_encode($response);
    exit();
}

$stmt->bind_param("s", $status);

foreach ($statusTypes as $statusType) {
    $status = $statusType;
    
    // Execute the prepared statement
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();
    
    // Fetch the count and store it in the data array
    $row = $result->fetch_assoc();
    $count = $row["count"];
    $data[$statusType] = $count;
}

$response = array("status" => "success", "data" => $data);

echo json_encode($response);

// Close the statement and connection
$stmt->close();
$conn->close();
?>
