<?php
include "../../connect_database.php";

session_start();
header('Content-Type: application/json');

$technician = $_SESSION['csu_id'];
$response = array(); // Initialize response array

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["type"])) {
        $type = $_POST["type"];
        $cid_number = $_POST["cid_number"]; 

        if ($type === "sor_save") {
            $sor_content = $_POST["sor_content"]; 
            $sor_donor = $_POST["sor_donor"]; 
            $sor_sord = $_POST["sor_sord"]; 
            $sor_eord = $_POST["sor_eord"]; 
            $warranty_end = $_POST["warranty_end"]; 
            $sor_we = $_POST["sor_we"]; 
            $sor_du = $_POST["sor_du"]; 
            
            $insertQuery = "INSERT INTO cid_summary_of_repairs 
                            (cid_number, cid_sor_content, cid_sor_start_date, cid_sor_end_date, cid_sor_warranty_start, cid_sor_warranty_end, cid_sor_we_value, cid_sor_we_duration)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                            ON DUPLICATE KEY UPDATE 
                            cid_sor_content = VALUES(cid_sor_content),
                            cid_sor_start_date = VALUES(cid_sor_start_date),
                            cid_sor_end_date = VALUES(cid_sor_end_date),
                            cid_sor_warranty_start = VALUES(cid_sor_warranty_start),
                            cid_sor_warranty_end = VALUES(cid_sor_warranty_end),
                            cid_sor_we_value = VALUES(cid_sor_we_value),
                            cid_sor_we_duration = VALUES(cid_sor_we_duration)";

            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("ssssssis", $cid_number, $sor_content, $sor_sord, $sor_eord, $sor_donor, $warranty_end, $sor_we, $sor_du);

            if ($stmt->execute()) { 
                $response['status'] = 'success';
                $response['message'] = 'Summary of Repairs saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
        else if ($type === "reco_save") {
            $reco_content = $_POST["reco_content"]; 
            $insertQuery = "INSERT INTO cid_recommendations (cid_number, cid_r_content)
                            VALUES (?, ?)
                            ON DUPLICATE KEY UPDATE cid_r_content = VALUES(cid_r_content)";

            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("ss", $cid_number, $reco_content);

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Recommendation(s) saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
        else if ($type === "sop_data_save") {
            $cid_number = $_POST["cid_number"];
            $service = $_POST["service"]; 
            $cost = $_POST["cost"]; 
            $discounted_price = $_POST["discounted_price"]; 
            $payment_method = $_POST["payment_method"]; 
            $ref_number = $_POST["ref_number"]; 
            $discount = $_POST["discount"]; 
            $paid = $_POST["paid"]; 
        
            $checkQuery = "SELECT COUNT(*) AS count FROM cid_summary_of_payments WHERE cid_number = ? AND cid_sop_service = ?";
            $checkStmt = $conn->prepare($checkQuery);
            $checkStmt->bind_param("ss", $cid_number, $service);
            $checkStmt->execute();
            $result = $checkStmt->get_result();
            $row = $result->fetch_assoc();
        
            if ($row['count'] > 0) {
                $insertQuery = "UPDATE cid_summary_of_payments 
                                SET cid_sop_cost = ?, cid_sop_discounted_price = ?, cid_sop_payment_method = ?, cid_sop_ref_no = ?, cid_sop_discount = ?, cid_sop_paid = ?
                                WHERE cid_number = ? AND cid_sop_service = ?";
                $stmt = $conn->prepare($insertQuery);
                $stmt->bind_param("sssssiss", $cost, $discounted_price, $payment_method, $ref_number, $discount, $paid, $cid_number, $service);
            } else {
                $insertQuery = "INSERT INTO cid_summary_of_payments (cid_number, cid_sop_service, cid_sop_cost, cid_sop_discounted_price, cid_sop_payment_method, cid_sop_ref_no, cid_sop_discount, cid_sop_paid)
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($insertQuery);
                $stmt->bind_param("sssssssi", $cid_number, $service, $cost, $discounted_price, $payment_method, $ref_number, $discount, $paid);
            }
        
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Payment record saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }    
        else if ($type === "sop_data_delete") {
            $cid_number = $_POST["cid_number"];
            $sop_id = $_POST["sop_id"]; 

            $deleteQuery = "DELETE FROM cid_summary_of_payments WHERE cid_number = ? AND cid_sop_id = ?";

            $stmt = $conn->prepare($deleteQuery);
            $stmt->bind_param("ii", $cid_number, $sop_id);

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Payment record deleted successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to delete data.';
            }
        } 
        else if ($type === "sop_r_save") {
            $sop_cr = $_POST["sop_cr"]; 
            $sop_or = $_POST["sop_or"]; 
        
            $insertQuery = "INSERT INTO cid_summary_of_payments_r (cid_number, cid_sop_cr, cid_sop_or)
                            VALUES (?, ?, ?)
                            ON DUPLICATE KEY UPDATE 
                            cid_sop_cr = VALUES(cid_sop_cr),
                            cid_sop_or = VALUES(cid_sop_or)";
        
            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("sss", $cid_number, $sop_cr, $sop_or);
        
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Payment Receipt saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
        else if ($type === "cid_claim") {
            $claimQuery = "INSERT INTO cs_cid_technicians (cid_number, cid_technician_id)
                            VALUES (?, ?)";
        
            $stmt = $conn->prepare($claimQuery);
            $stmt->bind_param("si", $cid_number, $technician);
        
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'CID claimed saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to claim cid.';
            }
        }
        else if ($type === "opt_tech") {
            $removeQuery = "DELETE FROM cs_cid_technicians
                    WHERE cid_number = ? AND cid_technician_id = ?";
    
            $stmt = $conn->prepare($removeQuery);
            $stmt->bind_param("si", $cid_number, $technician);
        
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Technician successfully removed from the project.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to delete data.';
            }  
        }
        else if ($type === "save_tech") {
            $technicians = $_POST["technicians"]; 

            $insertQuery = "INSERT INTO cs_cid_technicians (cid_number, cid_technician_id) VALUES (?, ?)";
        
            $stmt = $conn->prepare($insertQuery);
            
            $stmt->bind_param("si", $cid_number, $technician_id);

            foreach($technicians as $technician_id) {
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Technician(s) successfully added from the project.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
        }
        else {
            $response['status'] = 'error';
            $response['message'] = 'Invalid type';
            
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Type parameter not provided';
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method';
}

$conn->close();

echo json_encode($response);
?>