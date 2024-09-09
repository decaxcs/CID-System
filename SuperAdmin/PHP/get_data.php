<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$type = isset($_GET['type']) ? $_GET['type'] : '';


$data = array(); // Initialize $data here

if ($type === "") {
    $response = array("status" => "error", "message" => "Type parameter is missing");
    echo json_encode($response);
    exit();
} else if ($type === "cids" || $type === "delete_cid") {
    $status = $_GET["status"];
    if (!$status) {
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
                    i.isDeleted = 0
                GROUP BY
                    i.cid_number
                ORDER BY
                    i.cid_id DESC";
    } else {
        $status = $_GET["status"];
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
                    i.isDeleted = 0 AND i.cid_status = '$status'
                GROUP BY
                    i.cid_number
                ORDER BY
                    i.cid_created DESC";
    }

    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
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
} else if ($type === "view_cid") {
    $cid_number = $_GET["cid_number"];

    $queries = array(
        "cid_details" => "SELECT
                                i.*,
                                cd.cs_device_name,
                                cs.cid_cs_number,
                                cid_r.cid_r_content,
                                DATE_FORMAT(cid_r.cid_r_updated, '%M %d, %Y') AS formatted_recommendation_updated,
                                cid_sor.cid_sor_content,
                                DATE_FORMAT(cid_sor.cid_sor_start_date, '%M %d, %Y') AS formatted_cid_sor_start_date,
                                DATE_FORMAT(cid_sor.cid_sor_end_date, '%M %d, %Y') AS formatted_cid_sor_end_date,
                                DATE_FORMAT(cid_sor.cid_sor_updated, '%M %d, %Y') AS formatted_cid_sor_updated,
                                DATE_FORMAT(i.cid_created, '%M %d, %Y') AS formatted_cid_created,
                                GROUP_CONCAT(csu.csu_name SEPARATOR ', ') AS technician_names,
                                (SELECT GROUP_CONCAT(CONCAT('Cost: ', sop.cid_sop_cost, ', Discounted Price: ', sop.cid_sop_discounted_price, ',  Discount: ', sop.cid_sop_discount, ', Warranty Start: ', DATE_FORMAT(sop.cid_sop_warranty_start, '%M %d, %Y'), ', Warranty End: ', DATE_FORMAT(sop.cid_sop_warranty_end, '%M %d, %Y'), ', Warranty Duration: ', sop.cid_sop_warranty_duration, ' ', sop.cid_sop_warranty_unit, ', Warranty Type: ', sop.cid_sop_warranty_type) SEPARATOR '; ')
                                FROM cid_summary_of_payments sop
                                WHERE sop.cid_number = i.cid_number) AS payment_summary
                            FROM
                                cs_cid_information i
                            LEFT JOIN
                                cs_cid_technicians cct ON cct.cid_number = i.cid_number
                            LEFT JOIN
                                cs_users csu ON csu.csu_id = cct.cid_technician_id
                            LEFT JOIN
                                cid_claiming_slip cs ON cs.cid_number = i.cid_number
                            LEFT JOIN
                                cs_devices cd ON cd.cs_device_id = i.cid_device_id
                            LEFT JOIN
                                cid_recommendations cid_r ON cid_r.cid_number = i.cid_number
                            LEFT JOIN
                                cid_summary_of_repairs cid_sor ON cid_sor.cid_number = i.cid_number
                            WHERE
                                i.isDeleted = 0 AND i.cid_number = ?
                            ORDER BY
                                i.cid_created DESC",
        "cid_summary_payments" => "SELECT
                                sop.cid_sop_id,
                                sop.cid_number,
                                sop.cid_service_id,
                                s.cs_service_name,
                                sop.cid_sop_cost,
                                sop.cid_sop_discounted_price,
                                sop.cid_sop_discount,
                                DATE_FORMAT(sop.cid_sop_warranty_start, '%M %d, %Y') AS formatted_warranty_start,
                                DATE_FORMAT(sop.cid_sop_warranty_end, '%M %d, %Y') AS formatted_warranty_end,
                                sop.cid_sop_warranty_duration,
                                sop.cid_sop_warranty_unit,
                                sop.cid_sop_warranty_type,
                                DATE_FORMAT(sop.cid_sop_added, '%M %d, %Y') AS formatted_added,
                                DATE_FORMAT(sop.cid_sop_updated, '%M %d, %Y') AS formatted_updated
                            FROM
                                cid_summary_of_payments sop
                            LEFT JOIN
                                cs_services s
                            ON
                                sop.cid_service_id = s.cs_service_id 
                            WHERE
                                sop.cid_number = ?",
        "terms_of_service" => "SELECT c_c_tos.*,
                                c_tos.tos_content
                            FROM 
                                cs_cid_terms_of_service c_c_tos
                            LEFT JOIN
                                cs_terms_of_service c_tos ON c_tos.tos_id = c_c_tos.cid_tos_terms
                            
                            WHERE
                                cid_number = ?
                            ORDER BY
                                c_tos.tos_sequence ASC",
        "checklist" => "SELECT *
                            FROM 
                                cs_cid_checklist
                            WHERE
                                cid_number = ?",
        "cs_payments" => "SELECT cs_p.*, cs_m.cs_mop_name, DATE_FORMAT(cs_p.cs_p_paid_date, '%M %e %Y %h:%i %p') AS formatted_paid_date
                            FROM cs_payment cs_p
                            LEFT JOIN cs_mop AS cs_m ON cs_p.cs_p_mop = cs_m.cs_mop_id 
                            WHERE cs_p.cid_number = ? AND cs_p.isDeleted = 0 
                            ORDER BY cs_p.cs_p_paid_date ASC"
    );

    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

        $stmt->bind_param("s", $cid_number);
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
                $data[$key][] = $row;
            }
        }

        $stmt->close();
    }
} else if ($type === "accounts" || $type === "add_account" || $type === "update_account" || $type === "delete_account") {
    $query = "SELECT * FROM cs_users WHERE isDeleted = 0";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data['accounts'] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data['accounts'][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "view_account") {
    $csu_id = $_GET["csu_id"];

    $queries = array(
        "account_details" => "SELECT * FROM cs_users WHERE csu_id = $csu_id",
        "unique_cid_numbers" => "SELECT 
                            csu.csu_id, 
                                COUNT(DISTINCT i.cid_number) AS unique_cid_numbers 
                            FROM 
                                cs_cid_technicians cct 
                            LEFT JOIN 
                                cs_cid_information i ON cct.cid_number = i.cid_number
                            LEFT JOIN 
                                cs_users csu ON csu.csu_id = cct.cid_technician_id
                            WHERE 
                                i.isDeleted = 0 AND csu.csu_id = $csu_id        
                            GROUP BY 
                                csu.csu_id;",
        "status_counts" => "SELECT  
                                i.cid_status, 
                                COUNT(i.cid_number) AS status_count 
                            FROM 
                                cs_users csu
                            LEFT JOIN 
                                cs_cid_technicians cct ON csu.csu_id = cct.cid_technician_id
                            LEFT JOIN  
                                cs_cid_information i ON cct.cid_number = i.cid_number
                            WHERE   
                                i.isDeleted = 0 AND csu.csu_id = $csu_id
                            GROUP BY 
                                csu.csu_id, csu.csu_name, i.cid_status",
        "service_counts" => "SELECT s.cs_service_id, s.cs_service_name, COUNT(DISTINCT p.cid_number) AS num_cid_numbers
                                FROM cs_services s
                                LEFT JOIN cid_summary_of_payments p ON s.cs_service_id = p.cid_service_id
                                LEFT JOIN cs_cid_information i ON p.cid_number = i.cid_number
                                LEFT JOIN cs_cid_technicians ct ON i.cid_number = ct.cid_number
                                WHERE s.isDeleted = 0 AND i.isDeleted = 0 AND ct.cid_technician_id = $csu_id
                                GROUP BY s.cs_service_id, s.cs_service_name
                                ORDER BY num_cid_numbers DESC",

        "device_counts" => "SELECT d.cs_device_id, d.cs_device_name, COUNT(DISTINCT i.cid_number) AS num_cid_numbers
                                FROM cs_devices d
                                LEFT JOIN cs_cid_information i ON d.cs_device_id = i.cid_device_id
                                LEFT JOIN cs_cid_technicians ct ON i.cid_number = ct.cid_number
                                WHERE d.isDeleted = 0 AND i.isDeleted = 0 AND ct.cid_technician_id = $csu_id
                                GROUP BY d.cs_device_id, d.cs_device_name
                                ORDER BY num_cid_numbers DESC",
        "cids_details" => "SELECT
                                i.*,
                                cd.cs_device_name,
                                DATE_FORMAT(i.cid_created, '%M %d, %Y') AS formatted_cid_created
                            FROM
                                cs_cid_information i
                            LEFT JOIN
                                cs_cid_technicians cct ON cct.cid_number = i.cid_number
                            LEFT JOIN
                                cs_users csu ON csu.csu_id = cct.cid_technician_id
                            LEFT JOIN
                                cs_devices cd ON cd.cs_device_id = i.cid_device_id
                            WHERE
                                i.isDeleted = 0 AND csu.csu_id = $csu_id
                            ORDER BY
                                i.cid_created DESC"
    );

    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

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
} else if ($type === "file_management" || $type === "add_service" || $type === "add_device" || $type === "add_source" || $type === "update_service" || $type === "update_device" || $type === "delete_service" || $type === "update_source" ||  $type === "delete_device" || $type === "delete_source") {
    $queries = array(
        "services_list" => "SELECT * FROM cs_services WHERE isDeleted = 0",
        "devices_list" => "SELECT * FROM cs_devices WHERE isDeleted = 0",
        "sources_list" => "SELECT * FROM cs_sources WHERE isDeleted = 0"
    );

    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

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
                $data[$key][] = $row;
            }
        }

        $stmt->close();
    }
} else if ($type === "tos" || $type === "update_tos" || $type === "delete_tos") {
    $query = "SELECT * FROM cs_terms_of_service WHERE isDeleted = 0 ORDER BY tos_sequence ASC";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data["tos"] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data["tos"][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "analytics") {
    $start_date = isset($_GET['start_date']) ? $_GET['start_date'] : null;
    $end_date = isset($_GET['end_date']) ? $_GET['end_date'] : null;

    $queries = array(
        "unique_cid_numbers" => "SELECT COUNT(DISTINCT cid_number) AS unique_cid_numbers FROM cs_cid_information WHERE isDeleted = 0 AND (? IS NULL OR cid_created >= ?) AND (? IS NULL OR cid_created <= ?)",
        "status_counts" => "SELECT cid_status, COUNT(cid_number) AS status_count FROM cs_cid_information WHERE isDeleted = 0 AND (? IS NULL OR cid_created >= ?) AND (? IS NULL OR cid_created <= ?) GROUP BY cid_status",
        "service_counts" => "SELECT s.cs_service_id, s.cs_service_name, COUNT(DISTINCT p.cid_number) AS num_cid_numbers
                             FROM cs_services s
                            LEFT JOIN cid_summary_of_payments p ON s.cs_service_id = p.cid_service_id
                             LEFT JOIN cs_cid_information i ON p.cid_number = i.cid_number
                             WHERE s.isDeleted = 0 AND i.isDeleted = 0 AND (? IS NULL OR i.cid_created >= ?) AND (? IS NULL OR i.cid_created <= ?)
                             GROUP BY s.cs_service_id, s.cs_service_name
                             ORDER BY num_cid_numbers DESC",

        "device_counts" => "SELECT d.cs_device_id, d.cs_device_name, COUNT(DISTINCT i.cid_number) AS num_cid_numbers
                            FROM cs_devices d
                            LEFT JOIN cs_cid_information i ON d.cs_device_id = i.cid_device_id
                            WHERE d.isDeleted = 0 AND i.isDeleted = 0 AND (? IS NULL OR i.cid_created >= ?) AND (? IS NULL OR i.cid_created <= ?)
                            GROUP BY d.cs_device_id, d.cs_device_name
                            ORDER BY num_cid_numbers DESC",
        "source_counts" => "SELECT cid_advertisement, COUNT(cid_number) AS source_count FROM cs_cid_information WHERE isDeleted = 0 AND (? IS NULL OR cid_created >= ?) AND (? IS NULL OR cid_created <= ?) GROUP BY cid_advertisement",
    );

    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

        $stmt->bind_param('ssss', $start_date, $start_date, $end_date, $end_date);
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
} else if ($type === "settings") {
    $query = "SELECT * FROM cs_settings";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data["settings"] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data["settings"][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "logs") {
    $query = "SELECT l.*, cs_u.csu_name, DATE_FORMAT(l.timestamp, '%M %d, %Y %h:%i %p') AS formatted_timestamp
                FROM logs l
                LEFT JOIN cs_users cs_u ON l.user_id = cs_u.csu_id
                ORDER BY l.log_id DESC";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data["logs"] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data["logs"][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "cms" || $type === "save_cms") {
    $query = "SELECT * FROM cs_cms";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
        echo json_encode($response);
        exit();
    }
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result === false) {
        $response = array("status" => "error", "message" => "Error executing query: " . $stmt->error);
        echo json_encode($response);
        exit();
    }
    $data["cms"] = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data["cms"][] = $row;
        }
    }
    $stmt->close();
} else if ($type === "payments" || $type === "add_payment" || $type === "update_payment" || $type === "delete_payment") {
    $queries = array(
        "mop_list" => "SELECT * FROM cs_mop WHERE isDeleted = 0",
        "vat_value" => "SELECT * FROM cs_settings WHERE cs_settings_id = 2"
    );
    foreach ($queries as $key => $query) {
        $stmt = $conn->prepare($query);
        if (!$stmt) {
            $response = array("status" => "error", "message" => "Error preparing query: " . $conn->error);
            echo json_encode($response);
            exit();
        }

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
                $data[$key][] = $row;
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
