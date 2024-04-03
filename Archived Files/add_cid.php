<?php
include "../../connect_database.php";

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $checkboxValues = $_POST["checkboxValues"];
    $selectedOption = $_POST["selectedOption"] == 1 ? 1 : 0;

    $client_full_name = mysqli_real_escape_string($conn, $_POST["client_full_name"]);
    $client_contact = mysqli_real_escape_string($conn, $_POST["client_contact"]);
    $platinum_number = mysqli_real_escape_string($conn, $_POST["platinum_number"]);
    $representative = mysqli_real_escape_string($conn, $_POST["representative"]);
    $advertisement = mysqli_real_escape_string($conn, $_POST["advertisement"]);

    $platinum = $_POST["platinum"] == 1 ? 1 : 0;

    $currentMonth = date('m');
    $currentYear = date('Y');
    $baseNumber = $currentMonth . $currentYear . '-';
    $query = "SELECT MAX(CAST(SUBSTRING_INDEX(cid_number, '-', -1) AS UNSIGNED)) AS max_number FROM cs_cid_information WHERE cid_number LIKE '$currentMonth$currentYear-%'";
   
    $result = $conn->query($query);
    if ($result && $row = $result->fetch_assoc()) {
        $maxNumber = $row['max_number'];
        $incrementedNumber = ($maxNumber !== null) ? $maxNumber + 1 : 1;
        $finalNumber = $baseNumber . $incrementedNumber; 
        $insertQuery = "INSERT INTO cs_cid_information (cid_number, cid_client_full_name, cid_platinum, cid_client_contact, cid_platinum_number, cid_representative, cid_advertisement) 
                        VALUES ('$finalNumber', '$client_full_name', '$platinum', '$client_contact', '$platinum_number', '$representative', '$advertisement')";
        
        if ($conn->query($insertQuery) === TRUE) {
            foreach ($checkboxValues as $checkboxName => $checkboxValue) {
                $checkboxValue = $checkboxValue ? 1 : 0;
                $insertCheckboxQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
                                        VALUES ('$finalNumber', '$checkboxName', '$checkboxValue')";
                $conn->query($insertCheckboxQuery);
            }
            $insertOptionQuery = "INSERT INTO cs_cid_terms_of_service (cid_number, cid_tos_terms, cid_tos_agreement) 
            VALUES ('$finalNumber', 'tos_advertising_answer', '$selectedOption')";
            $conn->query($insertOptionQuery);

            $response['status'] = 'success';
            $response['cid_number'] = $finalNumber;
        } else {
            $response['status'] = 'error';
            $response['message'] = "Error: " . $insertQuery . "<br>" . $conn->error;
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = "Error: " . $query . "<br>" . $conn->error;
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

$conn->close();

echo json_encode($response);
?>