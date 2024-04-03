<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $checkboxValues = $_POST["checkboxValues"];
    $selectedOption = $_POST["selectedOption"] == 1 ? 1 : 0;

    $client_full_name = mysqli_real_escape_string($conn, $_POST["client_full_name"]);
    $client_contact = mysqli_real_escape_string($conn, $_POST["client_contact"]);
    $platinum_number = mysqli_real_escape_string($conn, $_POST["platinum_number"]);
    $representative = mysqli_real_escape_string($conn, $_POST["representative"]);
    $advertisement = mysqli_real_escape_string($conn, $_POST["advertisement"]);

    $cid_number = mysqli_real_escape_string($conn, $_POST["cid_number"]);
    $unit_details = mysqli_real_escape_string($conn, $_POST["unit_details"]);
    $remarks = mysqli_real_escape_string($conn, $_POST["remarks"]);
    $technician = mysqli_real_escape_string($conn, $_POST["technician"]);
    $computer_service = mysqli_real_escape_string($conn, $_POST["computer_service"]);
 
    $platinum = $_POST["platinum"] == 1 ? 1 : 0;

    $insertQuery = "INSERT INTO cs_cid_information (cid_client_full_name, cid_platinum, cid_client_contact, cid_platinum_number, cid_representative, cid_advertisement, cid_number, cid_unit_details, cid_remarks, cid_technician_id, cid_service_id, cid_status) 
                    VALUES ('$client_full_name', '$platinum', '$client_contact', '$platinum_number', '$representative', '$advertisement', '$cid_number', '$unit_details', '$remarks', '$technician', '$computer_service', 'On-going')";

    if ($conn->query($insertQuery) === TRUE) {

        foreach ($checkboxValues as $checkboxName => $checkboxValue) {
            $checkboxValue = isset($checkboxValue) && $checkboxValue == "true" ? 1 : 0;
            $insertCheckboxQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
                                    VALUES ('$cid_number', '$checkboxName', '$checkboxValue')";
            $conn->query($insertCheckboxQuery);
        }
        
        $insertOptionQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
                              VALUES ('$cid_number', 'tos_advertising_answer', '$selectedOption')";
        $conn->query($insertOptionQuery);

        $response['status'] = 'success';
        $response['cid_number'] = $cid_number;
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
