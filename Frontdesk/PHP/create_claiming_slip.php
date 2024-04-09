<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cid_number = $_POST["cid_number"];
    $cs_number = $_POST["cs_number"];
    $cs_color = $_POST["cs_color"];
    $cs_accesories = $_POST["cs_accesories"];

    $currentDateTime = date('F j, Y g:i A');

    // Check if a row with the given cid_number already exists
    $checkQuery = "SELECT * FROM cid_claiming_slip WHERE cid_number = '$cid_number'";
    $result = $conn->query($checkQuery);

    if ($result && $result->num_rows > 0) {
        // If a row exists, perform an UPDATE query
        $updateQuery = "UPDATE cid_claiming_slip SET cid_cs_number = '$cs_number', 
                        cid_cs_color = '$cs_color', 
                        cid_cs_accesories = '$cs_accesories' 
                        WHERE cid_number = '$cid_number'";

        if ($conn->query($updateQuery) === TRUE) {
            $response['status'] = 'success';
        } else {
            $response['status'] = 'error';
            $response['message'] = "Error: " . $updateQuery . "<br>" . $conn->error;
        }
    } else {
        // If no row exists, perform an INSERT query
        $insertQuery = "INSERT INTO cid_claiming_slip (cid_number, cid_cs_number, cid_cs_color, cid_cs_accesories) 
                        VALUES ('$cid_number', '$cs_number', '$cs_color', '$cs_accesories')";

        if ($conn->query($insertQuery) === TRUE) {
            $response['status'] = 'success';
        } else {
            $response['status'] = 'error';
            $response['message'] = "Error: " . $insertQuery . "<br>" . $conn->error;
        }
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

$conn->close();

echo json_encode($response);
?>
