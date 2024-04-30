<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["technician"]) && !empty($_POST["technician"])) {
        $technicians = $_POST["technician"];
    } else {
        $technicians = array(); // Set technicians to an empty array if not provided
    }

    $signature_dataURL = $_POST["signature_dataURL"];

    $checkboxes = $_POST["checkboxes"];
    $additional_checkboxes = $_POST["additional_checkboxes"];

    $additional_radiobuttons = $_POST["additional_radiobuttons"];
    $client_full_name = mysqli_real_escape_string($conn, $_POST["client_full_name"]);
    $client_contact = mysqli_real_escape_string($conn, $_POST["client_contact"]);
    $client_email = mysqli_real_escape_string($conn, $_POST["client_email"]);
    $platinum_number = mysqli_real_escape_string($conn, $_POST["platinum_number"]);
    $representative = mysqli_real_escape_string($conn, $_POST["representative"]);
    $advertisement = mysqli_real_escape_string($conn, $_POST["advertisement"]);

    $cid_number = mysqli_real_escape_string($conn, $_POST["cid_number"]);
    $unit_details = mysqli_real_escape_string($conn, $_POST["unit_details"]);
    $remarks = mysqli_real_escape_string($conn, $_POST["remarks"]);
    $unit_history = mysqli_real_escape_string($conn, $_POST["unit_history"]);
   
    $computer_service = mysqli_real_escape_string($conn, $_POST["computer_service"]);
 
    $platinum = $_POST["platinum"] == 1 ? 1 : 0;

    $insertQuery = "INSERT INTO cs_cid_information (cid_client_full_name, cid_signature, cid_platinum, cid_client_contact, cid_client_email, cid_platinum_number, cid_representative, cid_advertisement, cid_number, cid_unit_details, cid_remarks, cid_unit_history, cid_service_id, cid_status) 
                    VALUES ('$client_full_name', '$signature_dataURL', '$platinum', '$client_contact', '$client_email', '$platinum_number', '$representative', '$advertisement', '$cid_number', '$unit_details', '$remarks', '$unit_history', '$computer_service', 'On-going')";

    if ($conn->query($insertQuery) === TRUE) {

        // Insert technicians only if technicians are chosen
        if (!empty($technicians)) {
            foreach ($technicians as $technician) {
                $insertCheckboxQuery = "INSERT INTO cs_cid_technicians (cid_number, cid_technician_id) 
                                        VALUES ('$cid_number', '$technician')";
                $conn->query($insertCheckboxQuery);
            }
        }


        foreach ($checkboxes as $checkboxName => $checkboxValue) {
            $checkboxValue = $checkboxValue == "true" ? 1 : 0;
        
            $insertCheckboxQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
                                    VALUES ('$cid_number', '$checkboxName', '$checkboxValue')";
        
            $conn->query($insertCheckboxQuery);
        }
        
        foreach ($additional_checkboxes as $checkboxName => $checkboxValue) {
            $checkboxValue = $checkboxValue == "true" ? 1 : 0;
            $insertCheckboxQuery = "INSERT INTO cs_cid_terms_of_service_a (cid_number, tos_id, cid_tos_agreement) 
                                    VALUES ('$cid_number', '$checkboxName', '$checkboxValue')";
        
            $conn->query($insertCheckboxQuery);
        }

        foreach ($additional_radiobuttons as $radioButtonName => $radioButtonValue) {
            $radioButtonValue = $radioButtonValue == "Yes" ? 1 : 0;

            $insertRadioButtonQuery = "INSERT INTO cs_cid_terms_of_service_a (cid_number, tos_id, cid_tos_agreement) 
                                        VALUES ('$cid_number', '$radioButtonName', '$radioButtonValue')";
        
            $conn->query($insertRadioButtonQuery);
        }
        
        // $insertOptionQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
        //                       VALUES ('$cid_number', 'tos_advertising_answer', '$selectedOption')";
        // $conn->query($insertOptionQuery);

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
