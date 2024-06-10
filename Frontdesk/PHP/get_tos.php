<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$tos_sql = "SELECT tos_id, tos_content, tos_required, tos_sequence, 'tos' AS source
            FROM cs_terms_of_service
            WHERE isDeleted = 0
            ORDER BY tos_sequence";

    $additional_sql = "SELECT tos_a_id, tos_id, tos_a_content AS additional_content, tos_a_type AS additional_type, 'tos_additional' AS source
                    FROM cs_tos_additional";

$tos_result = $conn->query($tos_sql);
$additional_result = $conn->query($additional_sql);

$tos_data = array(); // Array to store data from cs_terms_of_service
$additional_data = array(); // Array to store data from cs_tos_additional

if ($tos_result->num_rows > 0) {
    while ($row = $tos_result->fetch_assoc()) {
        $tos_data[] = $row;
    }
}

if ($additional_result->num_rows > 0) {
    while ($row = $additional_result->fetch_assoc()) {
        $additional_data[] = $row;
    }
}

$response = array("status" => "success", "tos_data" => $tos_data, "additional_data" => $additional_data);
echo json_encode($response);

$conn->close();
?>
