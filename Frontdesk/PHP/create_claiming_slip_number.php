<?php
include "../../connect_database.php"; 
header('Content-Type: application/json');

$response = array();

function generateUniqueCidNumber($cid_number) { 
    global $conn; 

    $query = "SELECT cid_cs_number FROM cid_claiming_slip WHERE cid_number = '$cid_number'";
    $result = $conn->query($query);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['cid_cs_number'];
    } else {
        $currentMonth = date('m');
        $currentYear = date('Y');
        $baseNumber = $currentMonth . $currentYear . '-';

        $query = "SELECT MAX(CAST(SUBSTRING_INDEX(cid_cs_number, '-', -1) AS UNSIGNED)) AS max_number FROM cid_claiming_slip WHERE cid_cs_number LIKE '$currentMonth$currentYear-%'";
        $result = $conn->query($query);

        if ($result) {
            $row = $result->fetch_assoc();
            $maxNumber = $row['max_number'];
            $newNumber = ($maxNumber) ? $maxNumber + 1 : 1;
            return $baseNumber . $newNumber; 
        } else {
            return null;
        }
    }
}



if(isset($_GET['cid_number']) && !empty($_GET['cid_number'])) {
    $cid_number = $_GET['cid_number'];
    $sql_cids = "SELECT 
                    cid.*, 
                    devices_type.cs_device_name AS device_name, 
                    GROUP_CONCAT(technicians.csu_name) AS technician_names,
                    claiming_slip.cid_cs_number, 
                    claiming_slip.cid_cs_color,  
                    claiming_slip.cid_cs_accesories, 
                    DATE_FORMAT(cid.cid_created, '%M %e, %Y %l:%i %p') AS formatted_created  
                 FROM cs_cid_information AS cid
                 LEFT JOIN cs_cid_technicians AS cid_tech ON cid.cid_number = cid_tech.cid_number
                 LEFT JOIN cs_users AS technicians ON cid_tech.cid_technician_id = technicians.csu_id
                 LEFT JOIN cs_devices AS devices_type ON cid.cid_device_id = devices_type.cs_device_id
                 LEFT JOIN cid_claiming_slip AS claiming_slip ON cid.cid_number = claiming_slip.cid_number
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
                GROUP BY cid.cid_number, cid.cid_created, devices_type.cs_device_name
                ORDER BY cid.cid_created DESC;
                ";
}


$result_cids = $conn->query($sql_cids);

if ($result_cids === false) {
    $response = array("status" => "error", "message" => "Error executing query: " . $conn->error);
} else {
    $data = array();
    if ($result_cids->num_rows > 0) {
        while ($row = $result_cids->fetch_assoc()) {
            $data[] = $row;
        }
        $response = array("status" => "success", "cids_data" => $data);

        if (isset($cid_number)) { 
            $response['cid_cs_number'] = generateUniqueCidNumber($cid_number); 
        }
    } else {
        $response = array("status" => "success", "message" => "No CIDs found");
    }
}

$currentDateTime = date('F j, Y g:i A');


$response['current_datetime'] = $currentDateTime; 

echo json_encode($response);
$conn->close();
?>
