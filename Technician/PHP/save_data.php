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
            $sor_sord = $_POST["sor_sord"];
            $sor_eord = $_POST["sor_eord"];
            $checklist = isset($_POST["checklist"]) ? $_POST["checklist"] : [];

            // Insert or update the summary of repairs
            $insertQuery = "INSERT INTO cid_summary_of_repairs 
                            (cid_number, cid_sor_content, cid_sor_start_date, cid_sor_end_date)
                            VALUES (?, ?, ?, ?)
                            ON DUPLICATE KEY UPDATE 
                            cid_sor_content = VALUES(cid_sor_content),
                            cid_sor_start_date = VALUES(cid_sor_start_date),
                            cid_sor_end_date = VALUES(cid_sor_end_date)";

            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("ssss", $cid_number, $sor_content, $sor_sord, $sor_eord);

            if ($stmt->execute()) {
                // Prepare checklist data
                $fields = [];
                $values = [];
                $updateFields = [];

                if (isset($checklist['Wifi'])) {
                    $fields[] = 'cs_cid_c_wifi';
                    $values[] = $checklist['Wifi'];
                    $updateFields[] = 'cs_cid_c_wifi = VALUES(cs_cid_c_wifi)';
                }
                if (isset($checklist['Keyboard(FN Keys)'])) {
                    $fields[] = 'cs_cid_c_keyboard';
                    $values[] = $checklist['Keyboard(FN Keys)'];
                    $updateFields[] = 'cs_cid_c_keyboard = VALUES(cs_cid_c_keyboard)';
                }
                if (isset($checklist['Temperature'])) {
                    $fields[] = 'cs_cid_c_temperature';
                    $values[] = $checklist['Temperature'];
                    $updateFields[] = 'cs_cid_c_temperature = VALUES(cs_cid_c_temperature)';
                }
                if (isset($checklist['Tracepad'])) {
                    $fields[] = 'cs_cid_c_tracepad';
                    $values[] = $checklist['Tracepad'];
                    $updateFields[] = 'cs_cid_c_tracepad = VALUES(cs_cid_c_tracepad)';
                }
                if (isset($checklist['Bluetooth'])) {
                    $fields[] = 'cs_cid_c_bluetooth';
                    $values[] = $checklist['Bluetooth'];
                    $updateFields[] = 'cs_cid_c_bluetooth = VALUES(cs_cid_c_bluetooth)';
                }
                if (isset($checklist['Audio Jack'])) {
                    $fields[] = 'cs_cid_c_audiojack';
                    $values[] = $checklist['Audio Jack'];
                    $updateFields[] = 'cs_cid_c_audiojack = VALUES(cs_cid_c_audiojack)';
                }
                if (isset($checklist['Speaker'])) {
                    $fields[] = 'cs_cid_c_speaker';
                    $values[] = $checklist['Speaker'];
                    $updateFields[] = 'cs_cid_c_speaker = VALUES(cs_cid_c_speaker)';
                }
                if (isset($checklist['Camera'])) {
                    $fields[] = 'cs_cid_c_camera';
                    $values[] = $checklist['Camera'];
                    $updateFields[] = 'cs_cid_c_camera = VALUES(cs_cid_c_camera)';
                }
                if (isset($checklist['LCD (Brightness)'])) {
                    $fields[] = 'cs_cid_c_lcd';
                    $values[] = $checklist['LCD (Brightness)'];
                    $updateFields[] = 'cs_cid_c_lcd = VALUES(cs_cid_c_lcd)';
                }
                if (isset($checklist['Stress Test'])) {
                    $fields[] = 'cs_cid_c_stresstest';
                    $values[] = $checklist['Stress Test'];
                    $updateFields[] = 'cs_cid_c_stresstest = VALUES(cs_cid_c_stresstest)';
                }

                if (!empty($fields)) {
                    $fieldsStr = implode(', ', $fields);
                    $placeholders = implode(', ', array_fill(0, count($fields), '?'));
                    $updateFieldsStr = implode(', ', $updateFields);

                    $checklistQuery = "INSERT INTO cs_cid_checklist 
                                      (cid_number, $fieldsStr)
                                      VALUES (?, $placeholders)
                                      ON DUPLICATE KEY UPDATE 
                                      $updateFieldsStr";

                    $stmt_checklist = $conn->prepare($checklistQuery);
                    $stmt_checklist->bind_param(str_repeat('s', count($values) + 1), $cid_number, ...$values);

                    if ($stmt_checklist->execute()) {
                        $response['status'] = 'success';
                        $response['message'] = 'Summary of Repairs and Checklist saved successfully.';
                    } else {
                        $response['status'] = 'error';
                        $response['message'] = 'Failed to save checklist data.';
                    }
                } else {
                    $response['status'] = 'success';
                    $response['message'] = 'Summary of Repairs saved successfully, no checklist data to update.';
                }
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save summary of repairs data.';
            }
        } else if ($type === "reco_save") {
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
        } else if ($type === "sop_data_save") {
            $sop_id = isset($_POST["sop_id"]) ? $_POST["sop_id"] : null;
            $service = $_POST["service"];
            $cid_number = $_POST["cid_number"];
            $cost = $_POST["cost"];
            $discounted_price = $_POST["discounted_price"];
            $discount = $_POST["discount"];
            $warranty_start = isset($_POST["warranty_start"]) ? $_POST["warranty_start"] : null;
            $warranty_duration = isset($_POST["warranty_duration"]) ? $_POST["warranty_duration"] : null;
            $warranty_unit = isset($_POST["warranty_unit"]) ? $_POST["warranty_unit"] : null;
            $warranty_type = isset($_POST["warranty_type"]) ? $_POST["warranty_type"] : null;
            $warranty_end = isset($_POST["warranty_end"]) ? $_POST["warranty_end"] : null;

            // Check if cid_number and cid_sop_id are null
            if ($sop_id === null) {
                // Insert new data
                $insertQuery = "INSERT INTO cid_summary_of_payments 
                                (cid_number, cid_service_id, cid_sop_cost, cid_sop_discounted_price, cid_sop_discount, cid_sop_warranty_start, cid_sop_warranty_end, cid_sop_warranty_duration, cid_sop_warranty_unit, cid_sop_warranty_type)
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                // Prepare the statement
                $stmt = $conn->prepare($insertQuery);
                // Bind parameters
                $stmt->bind_param("ssssssssss", $cid_number, $service, $cost, $discounted_price,  $discount, $warranty_start, $warranty_end, $warranty_duration, $warranty_unit, $warranty_type);
            } else {
                // Update existing data
                $updateQuery = "UPDATE cid_summary_of_payments 
                                SET cid_service_id = ?, cid_sop_cost = ?, cid_sop_discounted_price = ?, cid_sop_discount = ?, cid_sop_warranty_start = ?, cid_sop_warranty_end = ?, cid_sop_warranty_duration = ?, cid_sop_warranty_unit = ?, cid_sop_warranty_type = ?
                                WHERE cid_number = ? AND cid_sop_id = ?";
                // Prepare the statement
                $stmt = $conn->prepare($updateQuery);
                // Bind parameters
                $stmt->bind_param("sssssssssss", $service, $cost, $discounted_price, $discount, $warranty_start, $warranty_end, $warranty_duration, $warranty_unit, $warranty_type, $cid_number, $sop_id);
            }

            // Execute the statement
            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Payment record saved successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        } else if ($type === "sop_data_delete") {
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
        } else if ($type === "save_infos") {
            $cid_number = $_POST["cid_number"];
            $unit_details = $_POST["unit_details"];
            $remarks = $_POST["remarks"];
            $unit_history = $_POST["unit_history"];
            $device_type = $_POST["device_type"];

            $updateQuery = "UPDATE cs_cid_information 
                                SET cid_unit_details = ?, cid_remarks = ?, cid_unit_history = ?, cid_device_id  = ?
                                WHERE cid_number = ?";

            $stmt = $conn->prepare($updateQuery);
            $stmt->bind_param("sssis", $unit_details, $remarks, $unit_history, $device_type, $cid_number);

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Data updated successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to update data.';
            }
        } else if ($type === "sop_r_save") {
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
        } else if ($type === "cid_claim") {
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
        } else if ($type === "opt_tech") {
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
        } else if ($type === "save_tech") {
            $technicians = $_POST["technicians"];

            $insertQuery = "INSERT INTO cs_cid_technicians (cid_number, cid_technician_id) VALUES (?, ?)";

            $stmt = $conn->prepare($insertQuery);

            $stmt->bind_param("si", $cid_number, $technician_id);

            foreach ($technicians as $technician_id) {
                if ($stmt->execute()) {
                    $response['status'] = 'success';
                    $response['message'] = 'Technician(s) successfully added from the project.';
                } else {
                    $response['status'] = 'error';
                    $response['message'] = 'Failed to save data.';
                }
            }
        } else if ($type === "status_save") {
            $status = $_POST["status"];

            $updateQuery = "UPDATE cs_cid_information SET cid_status = ? WHERE cid_number = ?";
            $stmt = $conn->prepare($updateQuery);

            $stmt->bind_param("ss", $status, $cid_number);

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Status successfully updated.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to update data.';
            }
        } else if ($type === "add_payment" || $type === "delete_payment") {
            if ($type === "add_payment") {
                $cid_number = $_POST["cid_number"];
                $note = $_POST["note"];
                $amount = $_POST["amount"];
                $mop = $_POST["mop"];
                $reference = $_POST["reference"];
                $vat = $_POST["vat"];
                $cf = $_POST["cf"];
                $total = $_POST["total"];
                $paid_date = $_POST["paid_date"];
                $ds = $_POST["ds"];
                $or = $_POST["or"];
                $balance = $_POST["balance"];

                $insertQuery = "INSERT INTO cs_payment 
                                (cs_p_note, cs_p_amount, cs_p_mop, cid_number, cs_p_reference, cs_p_vat, cs_p_cf, cs_p_total, cs_p_paid_date, cs_p_ds, cs_p_or, cs_p_balance) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                $stmt = $conn->prepare($insertQuery);

                $stmt->bind_param("sdsssdddsiid", $note, $amount, $mop, $cid_number, $reference, $vat, $cf, $total, $paid_date, $ds, $or, $balance);

                if ($stmt->execute()) {
                    $response['status'] = 'success';
                    $response['message'] = 'Successfully added payment.';
                } else {
                    $response['status'] = 'error';
                    $response['message'] = 'Failed to add payment.';
                }
            } else if ($type === "delete_payment") {
                $cs_p_id  = $_POST["cs_p_id"];

                $deleteQuery = "DELETE FROM cs_payment WHERE cs_p_id  = ?";

                $stmt = $conn->prepare($deleteQuery);
                $stmt->bind_param("i", $cs_p_id);

                if ($stmt->execute()) {
                    $response['status'] = 'success';
                    $response['message'] = 'Payment record deleted successfully.';
                } else {
                    $response['status'] = 'error';
                    $response['message'] = 'Failed to delete data.';
                }
            }
        } else {
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
