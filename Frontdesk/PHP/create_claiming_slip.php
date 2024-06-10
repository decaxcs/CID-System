<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cid_number = $_POST["cid_number"];
    $cs_number = $_POST["cs_number"];

    $currentDateTime = date('F j, Y g:i A');

    $checkQuery = "SELECT * FROM cid_claiming_slip WHERE cid_number = '$cid_number'";
    $result = $conn->query($checkQuery);

    if ($result && $result->num_rows > 0) {
        // If a row exists, perform an UPDATE query
        $updateQuery = "UPDATE cid_claiming_slip SET cid_cs_number = '$cs_number'
                        WHERE cid_number = '$cid_number'";

        if ($conn->query($updateQuery) === TRUE) {
            $response['status'] = 'success';
        } else {
            $response['status'] = 'error';
            $response['message'] = "Error: " . $updateQuery . "<br>" . $conn->error;
        }
    } else {
        // If no row exists, perform an INSERT query
        $insertQuery = "INSERT INTO cid_claiming_slip (cid_number, cid_cs_number) 
                        VALUES ('$cid_number', '$cs_number')";

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
