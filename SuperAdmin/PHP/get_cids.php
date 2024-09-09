<?php
include "../../connect_database.php";

header('Content-Type: application/json');

if (isset($_GET['cid_number']) && !empty($_GET['cid_number'])) {
    $cid_number = $_GET['cid_number'];
    $sql_cids = "SELECT 
                    cid.*, 
                    cid_r.cid_r_content,
                    cid_sor.cid_sor_content, cid_sor.cid_sor_start_date, cid_sor.cid_sor_end_date, cid_sor.cid_sor_warranty_start, cid_sor.cid_sor_warranty_end, cid_sor.cid_sor_service, cid_sor.cid_sor_we_value, cid_sor.cid_sor_we_duration,
                    cid_sop_r.cid_sop_cr, cid_sop_r.cid_sop_or,
                    devices_type.cs_device_name AS device_name, 
                    GROUP_CONCAT(technicians.csu_name) AS technician_names,
                    claiming_slip.cid_cs_number, 
                    claiming_slip.cid_cs_color,  
                    claiming_slip.cid_cs_accesories, 
                    DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                    DATE_FORMAT(cid_sor.cid_sor_start_date, '%M %e, %Y %l:%i %p') AS cid_sor_start_date,  
                    DATE_FORMAT(cid_sor.cid_sor_end_date, '%M %e, %Y %l:%i %p') AS cid_sor_end_date,  
                    DATE_FORMAT(cid_sor.cid_sor_warranty_start, '%M %e, %Y') AS cid_sor_warranty_start,  
                    DATE_FORMAT(cid_sor.cid_sor_warranty_end, '%M %e, %Y') AS cid_sor_warranty_end  
                 FROM cs_cid_information AS cid
                 LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                 LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                 LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                 LEFT JOIN cid_claiming_slip AS claiming_slip ON cid.cid_number = claiming_slip.cid_number
                 LEFT JOIN cid_recommendations AS cid_r ON cid.cid_number = cid_r.cid_number
                 LEFT JOIN cid_summary_of_payments_r AS cid_sop_r ON cid.cid_number = cid_sop_r.cid_number
                 LEFT JOIN cid_summary_of_repairs AS cid_sor ON cid.cid_number = cid_sor.cid_number
                 WHERE cid.cid_number = '$cid_number'
                 GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name, claiming_slip.cid_cs_number, claiming_slip.cid_cs_color, claiming_slip.cid_cs_accesories
                 ORDER BY cid.cid_created DESC";
} else {
    $sql_cids = "SELECT 
                cid.*, 
                devices_type.cs_device_name AS device_name, 
                DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                WHERE cid.isDeleted = 0
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_created DESC";
}

$result_cids = $conn->query($sql_cids);

if ($result_cids === false) {
    $response = array("status" => "error", "message" => "Error executing CID query: " . $conn->error);
    echo json_encode($response);
    exit();
}

$payments_data = array();
$checklist_data = array();
$cms_data = array();
$cs_payment_data = array();
if (isset($_GET['cid_number']) && !empty($_GET['cid_number'])) {
    $sql_payments = "SELECT payments.*, services.cs_service_name 
                     FROM cid_summary_of_payments AS payments
                     LEFT JOIN cs_services AS services ON payments.cid_service_id = services.cs_service_id
                     WHERE payments.cid_number = '$cid_number'";
    $result_payments = $conn->query($sql_payments);

    if ($result_payments === false) {
        $response = array("status" => "error", "message" => "Error executing payments query: " . $conn->error);
        echo json_encode($response);
        exit();
    }

    if ($result_payments->num_rows > 0) {
        while ($row = $result_payments->fetch_assoc()) {
            $payments_data[] = $row;
        }
    }


    $sql_checklist = "SELECT * FROM cs_cid_checklist WHERE cid_number = '$cid_number'";
    $result_checklist = $conn->query($sql_checklist);

    if ($result_checklist === false) {
        $response = array("status" => "error", "message" => "Error executing payments query: " . $conn->error);
        echo json_encode($response);
        exit();
    }

    if ($result_checklist->num_rows > 0) {
        while ($row = $result_checklist->fetch_assoc()) {
            $checklist_data[] = $row;
        }
    }

    $sql_cms = "SELECT * FROM cs_cms";
    $result_cms = $conn->query($sql_cms);

    if ($result_cms === false) {
        $response = array("status" => "error", "message" => "Error executing payments query: " . $conn->error);
        echo json_encode($response);
        exit();
    }

    if ($result_cms->num_rows > 0) {
        while ($row = $result_cms->fetch_assoc()) {
            $cms_data[] = $row;
        }
    }

    $sql_cs_payment = "SELECT cs_p.*, cs_m.cs_mop_name, DATE_FORMAT(cs_p.cs_p_paid_date, '%M %e %Y %h:%i %p') AS formatted_paid_date
                            FROM cs_payment cs_p
                            LEFT JOIN cs_mop AS cs_m ON cs_p.cs_p_mop = cs_m.cs_mop_id 
                            WHERE cs_p.cid_number = '$cid_number' AND cs_p.isDeleted = 0 
                            ORDER BY cs_p.cs_p_paid_date ASC";
    $result_cs_payment = $conn->query($sql_cs_payment);

    if ($result_cs_payment === false) {
        $response = array("status" => "error", "message" => "Error executing payments query: " . $conn->error);
        echo json_encode($response);
        exit();
    }

    if ($result_cs_payment->num_rows > 0) {
        while ($row = $result_cs_payment->fetch_assoc()) {
            $cs_payment_data[] = $row;
        }
    }
}




$data = array();

if ($result_cids->num_rows > 0) {
    while ($row = $result_cids->fetch_assoc()) {
        $data[] = $row;
    }
}

$response = array("status" => "success", "cids_data" => $data, "payments_data" => $payments_data,  "checklist_data" => $checklist_data,  "cms_data" => $cms_data,   "cs_payment_data" => $cs_payment_data);

echo json_encode($response);

$conn->close();