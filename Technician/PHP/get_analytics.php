<?php
include "../../connect_database.php";

header('Content-Type: application/json');

session_start();

$csu_id = $_SESSION['csu_id'];

$type = isset($_GET['type']) ? $_GET['type'] : '';

$data = array();

if ($type === "") {
    $response = array("status" => "error", "message" => "Type parameter is missing");
    echo json_encode($response);
    exit();
} else if ($type === "cids" || $type === "delete_cid") {
    $query = "SELECT
                    i.*,
                    cd.cs_device_name,
                    DATE_FORMAT(i.cid_created, '%M %d, %Y') AS formatted_cid_created,
                    GROUP_CONCAT(csu.csu_name SEPARATOR ', ') AS technician_names
                FROM
                    cs_cid_information i
                LEFT JOIN
                    cs_cid_technicians cct ON cct.cid_number = i.cid_number
                LEFT JOIN
                    cs_users csu ON csu.csu_id = cct.cid_technician_id
                LEFT JOIN
                    cs_devices cd ON cd.cs_device_id = i.cid_device_id
                WHERE
                    i.isDeleted = 0 AND cct.cid_technician_id = ?
                GROUP BY
                    i.cid_number
                ORDER BY
                    i.cid_created DESC";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->bind_param('i', $csu_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data['cids'] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data['cids'][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "analytics") {
    $start_date = isset($_GET['start_date']) ? $_GET['start_date'] : null;
    $end_date = isset($_GET['end_date']) ? $_GET['end_date'] : null;

    $queries = array(
        "unique_cid_numbers" => "SELECT COUNT(DISTINCT i.cid_number) AS unique_cid_numbers 
                                FROM cs_cid_information i
                                LEFT JOIN cs_cid_technicians cct ON cct.cid_number = i.cid_number
                                WHERE i.isDeleted = 0 AND cct.cid_technician_id = ? AND 
                                      (? IS NULL OR i.cid_created >= ?) AND 
                                      (? IS NULL OR i.cid_created <= ?)",
        "status_counts" => "SELECT i.cid_status, COUNT(i.cid_number) AS status_count 
                           FROM cs_cid_information i
                           LEFT JOIN cs_cid_technicians cct ON cct.cid_number = i.cid_number
                           WHERE i.isDeleted = 0 AND cct.cid_technician_id = ? AND 
                                 (? IS NULL OR i.cid_created >= ?) AND 
                                 (? IS NULL OR i.cid_created <= ?) 
                           GROUP BY i.cid_status",
        "device_counts" => "SELECT d.cs_device_id, d.cs_device_name, COUNT(DISTINCT i.cid_number) AS num_cid_numbers
                            FROM cs_devices d
                            LEFT JOIN cs_cid_information i ON d.cs_device_id = i.cid_device_id
                            LEFT JOIN cs_cid_technicians cct ON cct.cid_number = i.cid_number
                            WHERE d.isDeleted = 0 AND i.isDeleted = 0 AND cct.cid_technician_id = ? AND 
                                  (? IS NULL OR i.cid_created >= ?) AND 
                                  (? IS NULL OR i.cid_created <= ?)
                            GROUP BY d.cs_device_id, d.cs_device_name
                            ORDER BY num_cid_numbers DESC",

        "source_counts" => "SELECT i.cid_advertisement, COUNT(i.cid_number) AS source_count 
                           FROM cs_cid_information i
                           LEFT JOIN cs_cid_technicians cct ON cct.cid_number = i.cid_number
                           WHERE i.isDeleted = 0 AND cct.cid_technician_id = ? AND 
                                 (? IS NULL OR i.cid_created >= ?) AND 
                                 (? IS NULL OR i.cid_created <= ?)
                           GROUP BY i.cid_advertisement",

        "service_counts" => "SELECT s.cs_service_id, s.cs_service_name, COUNT(DISTINCT p.cid_number) AS num_cid_numbers
                             FROM cs_services s
                             LEFT JOIN cid_summary_of_payments p ON s.cs_service_id = p.cid_service_id
                             LEFT JOIN cs_cid_information i ON p.cid_number = i.cid_number
                             LEFT JOIN cs_cid_technicians cct ON cct.cid_number = i.cid_number
                             WHERE s.isDeleted = 0 AND i.isDeleted = 0 AND cct.cid_technician_id = ? AND (? IS NULL OR i.cid_created >= ?) AND (? IS NULL OR i.cid_created <= ?)
                             GROUP BY s.cs_service_id, s.cs_service_name
                             ORDER BY num_cid_numbers DESC"
    );

    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

        $stmt->bind_param('issss', $csu_id, $start_date, $start_date, $end_date, $end_date);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result === false) {
            $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
            echo json_encode($response);
            exit();
        }

        $data[$key] = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if ($key === "status_counts") {
                    $data[$key][$row['cid_status']] = $row;
                } else {
                    $data[$key][] = $row;
                }
            }
        }
        $stmt->close();
    }
} else {
    $response = array("status" => "error", "message" => "Invalid type");
    echo json_encode($response);
    exit();
}

$response = array("status" => "success", "data" => $data);
echo json_encode($response);

$conn->close();
