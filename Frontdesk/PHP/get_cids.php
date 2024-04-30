<?php
include "../../connect_database.php";

header('Content-Type: application/json');

if(isset($_GET['cid_number']) && !empty($_GET['cid_number'])) {
    $cid_number = $_GET['cid_number'];
    $sql_cids = "SELECT 
                    cid.*, 
                    services_type.cs_service_name AS service_name, 
                    GROUP_CONCAT(technicians.csu_name) AS technician_names,
                    claiming_slip.cid_cs_number, 
                    claiming_slip.cid_cs_color,  
                    claiming_slip.cid_cs_accesories, 
                    DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created  
                 FROM cs_cid_information AS cid
                 LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                 LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                 LEFT JOIN cs_services AS services_type ON cid.cid_service_id = services_type.cs_service_id
                 LEFT JOIN cid_claiming_slip AS claiming_slip ON cid.cid_number = claiming_slip.cid_number
                 WHERE cid.cid_number = '$cid_number'
                 GROUP BY cid.cid_number, cid.cid_created, services_type.cs_service_name, claiming_slip.cid_cs_number, claiming_slip.cid_cs_color, claiming_slip.cid_cs_accesories
                 ORDER BY cid.cid_created DESC";
                
} else {
    $sql_cids = "SELECT 
                cid.*, 
                services_type.cs_service_name AS service_name, 
                DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created,
                GROUP_CONCAT(technicians.csu_name) AS technician_names
                FROM cs_cid_information AS cid
                LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                LEFT JOIN cs_services AS services_type ON cid.cid_service_id = services_type.cs_service_id
                GROUP BY cid.cid_number, cid.cid_created, services_type.cs_service_name
                ORDER BY cid.cid_created DESC;
                ";
}

$result_cids = $conn->query($sql_cids);

if ($result_cids === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
    echo json_encode($response);
    exit();
}

$data = array();

if ($result_cids->num_rows > 0) {
    while ($row = $result_cids->fetch_assoc()) {
        $data[] = $row;
    }
}

$response = array("status" => "success", "cids_data" => $data);

echo json_encode($response);

$conn->close();
?>
