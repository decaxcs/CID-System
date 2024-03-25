<?php
include "../connect_database.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $client_full_name = $_POST["client_full_name"];

    $currentMonth = date('m');
    $currentYear = date('Y');

    $baseNumber = $currentMonth . $currentYear . '-';

    $query = "SELECT MAX(CAST(SUBSTRING_INDEX(cid_number, '-', -1) AS UNSIGNED)) AS max_number FROM cs_cid_information WHERE cid_number LIKE '$currentMonth$currentYear-%'";
    $result = $conn->query($query);

    if ($result && $row = $result->fetch_assoc()) {
        $maxNumber = $row['max_number'];
        if ($maxNumber !== null) {
            $incrementedNumber = $maxNumber + 1;
        } else {
            $incrementedNumber = 1;
        }

        $finalNumber = $baseNumber . $incrementedNumber;

        $insertQuery = "INSERT INTO cs_cid_information (cid_number, cid_client_full_name) VALUES ('$finalNumber', '$client_full_name')";
        if ($conn->query($insertQuery) === TRUE) {
            echo $finalNumber;
            exit();
        } else {
            echo "Error: " . $insertQuery . "<br>" . $conn->error;
        }
    } else {
        echo "Error: " . $query . "<br>" . $conn->error;
    }
}
$conn->close();
?>
