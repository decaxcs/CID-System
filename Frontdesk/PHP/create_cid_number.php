<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array(); // Initialize response array

$currentMonth = date('m');
$currentYear = date('Y');
$baseNumber = $currentMonth . $currentYear . '-';
$query = "SELECT MAX(CAST(SUBSTRING_INDEX(cid_number, '-', -1) AS UNSIGNED)) AS max_number FROM cs_cid_information WHERE cid_number LIKE '$currentMonth$currentYear-%'";
$result = $conn->query($query);

if ($result) {
    // If query is successful
    $row = $result->fetch_assoc();
    $maxNumber = $row['max_number'];
    $newNumber = ($maxNumber) ? $maxNumber + 1 : 1; // Increment the max number or set to 1 if no records found
    $finalNumber = $baseNumber . $newNumber;
    
    $response['status'] = 'success';
    $response['cid_number'] = $finalNumber;
} else {
    // If query fails
    $response['status'] = 'error';
    $response['message'] = "Error: " . $query . "<br>" . $conn->error;
}

$conn->close(); // Close database connection

echo json_encode($response); // Send JSON response
?>
