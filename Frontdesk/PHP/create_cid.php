<?php
include "../../connect_database.php";

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cid_number = mysqli_real_escape_string($conn, $_POST["cid_number"]);
    $claiming_slip = mysqli_real_escape_string($conn, $_POST["claiming_slip"]);
    $unit_details = mysqli_real_escape_string($conn, $_POST["unit_details"]);
    $remarks = mysqli_real_escape_string($conn, $_POST["remarks"]);
    $technician = mysqli_real_escape_string($conn, $_POST["technician"]);
    $computer_service = mysqli_real_escape_string($conn, $_POST["computer_service"]);

    // Construct the SQL query
    $insertQuery = "INSERT INTO cs_cid_records (cid_number, cid_claiming_slip, cid_unit_details, cid_remarks, cid_technician_id, cid_service_id) 
                    VALUES ('$cid_number', '$claiming_slip', '$unit_details', '$remarks', '$technician', '$computer_service')";

    // Execute the SQL query
    if ($conn->query($insertQuery) === TRUE) {
        $response['status'] = 'success';
        $response['message'] = 'Record inserted successfully';
    } else {
        $response['status'] = 'error';
        $response['message'] = "Error: " . $insertQuery . "<br>" . $conn->error;
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

$conn->close();

echo json_encode($response);
?>
