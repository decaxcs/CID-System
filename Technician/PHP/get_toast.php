<?php
include "../../connect_database.php";

session_start();

header('Content-Type: application/json');

$response = array(); 

$technician = $_SESSION['csu_id'];

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $sql_cid_numbers = "
                        SELECT
                            ct.cid_number
                        FROM
                            cs_cid_technicians ct
                        INNER JOIN
                            cs_cid_information ci ON ct.cid_number = ci.cid_number
                        WHERE
                            ct.cid_technician_id = ? AND ci.isDeleted = 0
                    ";
    $stmt_cid_numbers = $conn->prepare($sql_cid_numbers);
    $stmt_cid_numbers->bind_param("s", $technician);
    $stmt_cid_numbers->execute();
    $result_cid_numbers = $stmt_cid_numbers->get_result();
    
    while ($row_cid_numbers = $result_cid_numbers->fetch_assoc()) {
        $cid_number = $row_cid_numbers['cid_number'];

        $sql_updated_dates = "  
                        SELECT
                        MAX(GREATEST(
                            COALESCE(cid_r.cid_r_updated, '1900-01-01'),
                            COALESCE(cid_sor.cid_sor_updated, '1900-01-01'),
                            COALESCE(cid_sop.cid_sop_updated, '1900-01-01'),
                            COALESCE(cid_sop_r.cid_sop_r_updated, '1900-01-01')
                        )) AS most_recent_date,
                        cid.cid_status  
                        FROM 
                            cid_recommendations AS cid_r
                            LEFT JOIN cid_summary_of_repairs AS cid_sor ON cid_r.cid_number = cid_sor.cid_number
                            LEFT JOIN cid_summary_of_payments AS cid_sop ON cid_r.cid_number = cid_sop.cid_number
                            LEFT JOIN cid_summary_of_payments_r AS cid_sop_r ON cid_r.cid_number = cid_sop_r.cid_number
                            LEFT JOIN cs_cid_information AS cid ON cid_r.cid_number = cid.cid_number
                        WHERE 
                            cid_r.cid_number = ?;
                            ";

        $stmt_updated_dates = $conn->prepare($sql_updated_dates);
        $stmt_updated_dates->bind_param("s", $cid_number);
        $stmt_updated_dates->execute();
        $result_updated_dates = $stmt_updated_dates->get_result();
        $row_updated_dates = $result_updated_dates->fetch_assoc();
        
        $most_recent_date = $row_updated_dates['most_recent_date'];
        $cid_status = $row_updated_dates['cid_status'];
        
        if (empty($most_recent_date)) {
            $sql_creation_date = "SELECT cid_created FROM cs_cid_information WHERE cid_number = ?";
            $stmt_creation_date = $conn->prepare($sql_creation_date);
            $stmt_creation_date->bind_param("s", $cid_number);
            $stmt_creation_date->execute();
            $result_creation_date = $stmt_creation_date->get_result();
            $cid_created = $result_creation_date->fetch_assoc()['cid_created'];
            $most_recent_date = $cid_created;
        }

        $sql_settings = "SELECT cs_settings_value, cs_settings_unit FROM cs_settings WHERE cs_settings_name = 'technician_notification'";
        $stmt_settings = $conn->prepare($sql_settings);
        $stmt_settings->execute();
        $result_settings = $stmt_settings->get_result();
        $settings = $result_settings->fetch_assoc();

        $cs_settings_value = $settings['cs_settings_value'];
        $cs_settings_unit = $settings['cs_settings_unit'];
        $new_date = date('Y-m-d', strtotime("$most_recent_date + $cs_settings_value $cs_settings_unit"));

        $response['dates'][$cid_number] = array(
            'cid_number' => $cid_number,
            'cid_status' => $cid_status,
            'most_recent_date' => $most_recent_date,
            'new_date' => $new_date,
            'settings_value' => $cs_settings_value,
            'settings_unit' => $cs_settings_unit,
        );
    }

    $response['status'] = 'success';
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

echo json_encode($response);

$conn->close();
?>
