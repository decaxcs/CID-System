<?php
include "../../connect_database.php";

session_start();

header('Content-Type: application/json');

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cid_number = $_POST["cid_number"];

    // Query to retrieve data from cs_cid_information table and related tables
    $sql_cids = "
        SELECT cid.*,
            cid.cid_number AS cid_number_cid,
            devices_type.cs_device_name AS service_name, 
            DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created, 
            GROUP_CONCAT(technicians.csu_name) AS technician_names, 
            claiming_slip.cid_cs_number, 
            recommendations.cid_r_content AS recommendation, 
            summaryofrepairs.*,
            summaryofpayments_r.*,
            DATE_FORMAT(summaryofrepairs.cid_sor_warranty_end, '%M %e, %Y') AS formatted_warranty_end
        FROM cs_cid_information AS cid
        LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
        LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
        LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
        LEFT JOIN cid_claiming_slip AS claiming_slip ON cid.cid_number = claiming_slip.cid_number
        LEFT JOIN cid_recommendations AS recommendations ON cid.cid_number = recommendations.cid_number
        LEFT JOIN cid_summary_of_repairs AS summaryofrepairs ON cid.cid_number = summaryofrepairs.cid_number
        LEFT JOIN cid_summary_of_payments_r AS summaryofpayments_r ON cid.cid_number = summaryofpayments_r.cid_number
        WHERE cid.cid_number = ?
        GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
        ORDER BY cid.cid_created DESC";
    $stmt = $conn->prepare($sql_cids);
    $stmt->bind_param("s", $cid_number);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $data = $result->fetch_all(MYSQLI_ASSOC);

        // Payments
        $sql_payments = "
            SELECT 
                summaryofpayments.*, 
                services.cs_service_name AS service_name
            FROM cid_summary_of_payments AS summaryofpayments
            LEFT JOIN cs_services AS services ON summaryofpayments.cid_service_id = services.cs_service_id
            WHERE summaryofpayments.cid_number = ?";
        $stmt_payments = $conn->prepare($sql_payments);
        $stmt_payments->bind_param("s", $cid_number);
        $stmt_payments->execute();
        $result_payments = $stmt_payments->get_result();
        $payments_data = $result_payments->fetch_all(MYSQLI_ASSOC);

        // Query to retrieve all device types from cs_devices table
        $sql_devices = "SELECT cs_device_id, cs_device_name FROM cs_devices WHERE isDeleted = 0";
        $result_devices = $conn->query($sql_devices);


        if ($result_devices->num_rows > 0) {
            $devices_data = $result_devices->fetch_all(MYSQLI_ASSOC);
        } else {
            $devices_data = [];
        }

        // Query to retrieve checklist data
        $sql_checklist = "SELECT * FROM cs_cid_checklist WHERE cid_number = ?";
        $stmt_checklist = $conn->prepare($sql_checklist);
        $stmt_checklist->bind_param("s", $cid_number);
        $stmt_checklist->execute();
        $result_checklist = $stmt_checklist->get_result();
        $checklist_data = $result_checklist->fetch_all(MYSQLI_ASSOC);

        $sql_mop = "SELECT * FROM cs_mop WHERE isDeleted = 0";
        $stmt_mop = $conn->prepare($sql_mop);
        $stmt_mop->execute();
        $result_mop = $stmt_mop->get_result();
        $mop_data = $result_mop->fetch_all(MYSQLI_ASSOC);

        $sql_service = "SELECT * FROM cs_services WHERE isDeleted = 0";
        $stmt_service = $conn->prepare($sql_service);
        $stmt_service->execute();
        $result_service = $stmt_service->get_result();
        $service_data = $result_service->fetch_all(MYSQLI_ASSOC);

        $sql_sum = "
        SELECT 
            SUM(summaryofpayments.cid_sop_discounted_price) AS total_discounted_price
        FROM cid_summary_of_payments AS summaryofpayments
        WHERE summaryofpayments.cid_number = ?";

        $stmt_sum = $conn->prepare($sql_sum);
        $stmt_sum->bind_param("s", $cid_number);
        $stmt_sum->execute();
        $result_sum = $stmt_sum->get_result();
        $total_discounted_price = $result_sum->fetch_assoc();

        $sql_settings = "SELECT * FROM cs_settings WHERE cs_settings_id  = 2";
        $stmt_settings = $conn->prepare($sql_settings);
        $stmt_settings->execute();
        $result_settings = $stmt_settings->get_result();
        $settings_data = $result_settings->fetch_all(MYSQLI_ASSOC);

        $sql_cs_payment = "SELECT cs_p.*, cs_m.cs_mop_name, DATE_FORMAT(cs_p.cs_p_paid_date, '%M %e %Y %h:%i %p') AS formatted_paid_date
                            FROM cs_payment cs_p
                            LEFT JOIN cs_mop AS cs_m ON cs_p.cs_p_mop = cs_m.cs_mop_id 
                            WHERE cs_p.cid_number = ? AND cs_p.isDeleted = 0 
                            ORDER BY cs_p.cs_p_paid_date ASC";
        $stmt_cs_payment = $conn->prepare($sql_cs_payment);
        $stmt_cs_payment->bind_param("s", $cid_number);
        $stmt_cs_payment->execute();
        $result_cs_payment = $stmt_cs_payment->get_result();
        $cs_payment_data = $result_cs_payment->fetch_all(MYSQLI_ASSOC);

        $response['status'] = 'success';
        $response['data'] = $data;
        $response['payments_data'] = $payments_data;
        $response['devices_data'] = $devices_data;
        $response['checklist_data'] = $checklist_data;
        $response['mop_data'] = $mop_data;
        $response['service_data'] = $service_data;
        $response['total_discounted_price'] = $total_discounted_price;
        $response['settings_data'] = $settings_data;
        $response['cs_payment_data'] = $cs_payment_data;
    } else {
        $response['status'] = 'error';
        $response['message'] = 'No data found';
    }
    $stmt->close();
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

echo json_encode($response);

$conn->close();
