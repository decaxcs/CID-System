<?php
include "../../connect_database.php";

header('Content-Type: application/json');

$response = array();

$type = isset($_POST['type']) ? $_POST['type'] : '';

if ($type === "") {
    $response = array("status" => "error", "message" => "Type parameter is missing");
    echo json_encode($response);
    exit();
} else if ($type === "delete_cid") {
    $cid_number = $_POST['cid_number'];

    $softDeleteQuery = "UPDATE cs_cid_information SET isDeleted = 1 WHERE cid_number = ?";
    $stmt = $conn->prepare($softDeleteQuery);
    $stmt->bind_param("s", $cid_number);

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'CID deleted successfully.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to delete data.';
    }
} else if ($type === "add_account" || $type === "update_account" || $type === "delete_account") {
    if ($type === "add_account") {
        $csu_name = $_POST["csu_name"];
        $csu_permission = $_POST["csu_permission"];
        $csu_username = $_POST["csu_username"];
        $csu_password = $_POST["csu_password"];

        $checkQuery = "SELECT * FROM cs_users WHERE csu_username = ?";
        $checkStmt = $conn->prepare($checkQuery);
        $checkStmt->bind_param("s", $csu_username);
        $checkStmt->execute();
        $result = $checkStmt->get_result();
        if ($result->num_rows > 0) {
            $response['status'] = 'error';
            $response['message'] = 'Username already exists.';
        } else {
            $encrypted_password = password_hash($csu_password, PASSWORD_DEFAULT);

            $insertQuery = "INSERT INTO cs_users 
                            (csu_name, csu_permission, csu_username, csu_password)
                            VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($insertQuery);
            $stmt->bind_param("ssss", $csu_name, $csu_permission, $csu_username, $encrypted_password);

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Account added successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
    } else if ($type === "update_account") {
        $csu_id = $_POST["csu_id"];
        $csu_name = $_POST["csu_name"];
        $csu_permission = $_POST["csu_permission"];
        $csu_username = $_POST["csu_username"];
        $csu_password = isset($_POST["csu_password"]) ? $_POST["csu_password"] : null;

        $checkQuery = "SELECT * FROM cs_users WHERE csu_username = ? AND csu_id != ?";
        $checkStmt = $conn->prepare($checkQuery);
        $checkStmt->bind_param("si", $csu_username, $csu_id);
        $checkStmt->execute();
        $result = $checkStmt->get_result();
        if ($result->num_rows > 0) {
            $response['status'] = 'error';
            $response['message'] = 'Username already exists.';
        } else {
            if ($csu_password) {
                $encrypted_password = password_hash($csu_password, PASSWORD_DEFAULT);
                $updateQuery = "UPDATE cs_users
                                SET csu_name = ?, csu_permission = ?, csu_username = ?, csu_password = ?
                                WHERE csu_id = ?";
                $stmt = $conn->prepare($updateQuery);
                $stmt->bind_param("ssssi", $csu_name, $csu_permission, $csu_username, $encrypted_password, $csu_id);
            } else {
                $updateQuery = "UPDATE cs_users
                                SET csu_name = ?, csu_permission = ?, csu_username = ?
                                WHERE csu_id = ?";
                $stmt = $conn->prepare($updateQuery);
                $stmt->bind_param("sssi", $csu_name, $csu_permission, $csu_username, $csu_id);
            }

            if ($stmt->execute()) {
                $response['status'] = 'success';
                $response['message'] = 'Account updated successfully.';
            } else {
                $response['status'] = 'error';
                $response['message'] = 'Failed to save data.';
            }
        }
    } else if ($type === "delete_account") {
        $csu_id = $_POST["csu_id"];
        $softDeleteQuery = "UPDATE cs_users SET isDeleted = 1 WHERE csu_id = ?";
        $stmt = $conn->prepare($softDeleteQuery);
        $stmt->bind_param("i", $csu_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Account deleted successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    }
}

// Add Service/Device
else if ($type === "add_service" || $type === "add_device" || $type === "add_source" || $type === "update_service" || $type === "update_device" || $type === "update_source" || $type === "delete_service" ||  $type === "delete_device" || $type === "delete_source") {
    if ($type === "add_service") {
        $new_service = $_POST["new_service"];
        $insertQuery = "INSERT INTO cs_services 
                        (cs_service_name)
                        VALUES (?)";
        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("s", $new_service);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Service added successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "add_device") {
        $new_device = $_POST["new_device"];
        $insertQuery = "INSERT INTO cs_devices 
                        (cs_device_name)
                        VALUES (?)";
        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("s", $new_device);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Device added successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "add_source") {
        $new_source = $_POST["new_source"];
        $insertQuery = "INSERT INTO cs_sources 
                        (cs_source_name)
                        VALUES (?)";
        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("s", $new_source);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Source added successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "update_service") {
        $cs_service_id = $_POST["cs_service_id"];
        $cs_service_name = $_POST["cs_service_name"];
        $updateQuery = "UPDATE cs_services
                        SET cs_service_name = ?
                        WHERE cs_service_id  = ?";

        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("si", $cs_service_name,  $cs_service_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Service updated successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "update_device") {
        $cs_device_id = $_POST["cs_device_id"];
        $cs_device_name = $_POST["cs_device_name"];
        $updateQuery = "UPDATE cs_devices
                        SET cs_device_name = ?
                        WHERE cs_device_id   = ?";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("si", $cs_device_name,  $cs_device_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Device updated successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "update_source") {
        $cs_source_id = $_POST["cs_source_id"];
        $cs_source_name = $_POST["cs_source_name"];
        $updateQuery = "UPDATE cs_sources
                        SET cs_source_name = ?
                        WHERE cs_source_id   = ?";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("si", $cs_source_name,  $cs_source_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Source updated successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "delete_service") {
        $cs_service_id = $_POST["cs_service_id"];
        $softDeleteQuery = "UPDATE cs_services SET isDeleted = 1 WHERE cs_service_id = ?";
        $stmt = $conn->prepare($softDeleteQuery);
        $stmt->bind_param("i", $cs_service_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Service deleted successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "delete_device") {
        $cs_device_id = $_POST["cs_device_id"];
        $softDeleteQuery = "UPDATE cs_devices SET isDeleted = 1 WHERE cs_device_id = ?";
        $stmt = $conn->prepare($softDeleteQuery);
        $stmt->bind_param("i", $cs_device_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Device deleted successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    } else if ($type === "delete_source") {
        $cs_source_id = $_POST["cs_source_id"];
        $softDeleteQuery = "UPDATE cs_sources SET isDeleted = 1 WHERE cs_source_id = ?";
        $stmt = $conn->prepare($softDeleteQuery);
        $stmt->bind_param("i", $cs_source_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Source deleted successfully.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to save data.';
        }
    }
}

// Update Terms of Service
else if ($type === "update_tos" || $type === "add_tos") {
    $tos_id = isset($_POST["tos_id"]) ? $_POST["tos_id"] : null;
    $tos_content = $_POST["tos_content"];
    $tos_sequence = $_POST["tos_sequence"];

    if ($tos_id === null) {
        $insertQuery = "INSERT INTO cs_terms_of_service 
                        (tos_content, tos_sequence)
                        VALUES (?, ?)";

        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("si", $tos_content,  $tos_sequence);
    } else {
        $updateQuery = "UPDATE cs_terms_of_service
                        SET tos_content = ?, tos_sequence = ?
                        WHERE tos_id = ?";

        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("sii", $tos_content,  $tos_sequence, $tos_id);
    }

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'ToS saved successfully.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to save data.';
    }
}

// Delete Terms of Service
else if ($type === "delete_tos") {
    $tos_id = isset($_POST["tos_id"]) ? $_POST["tos_id"] : null;

    if ($tos_id === null) {
        $response = array("status" => "error", "message" => "ToS ID is missing");
        echo json_encode($response);
        exit();
    }

    $softDeleteQuery = "UPDATE cs_terms_of_service SET isDeleted = 1 WHERE tos_id = ?";
    $stmt = $conn->prepare($softDeleteQuery);
    $stmt->bind_param("i", $tos_id);

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'ToS deleted successfully.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to delete data.';
    }
}

// Update Settings
else if ($type === "update_settings") {
    $cs_settings_id = $_POST["cs_settings_id"];
    $cs_settings_value = $_POST["cs_settings_value"];
    $cs_settings_unit = $_POST["cs_settings_unit"];

    $updateQuery = "UPDATE cs_settings
    SET cs_settings_value = ?, cs_settings_unit = ?
    WHERE cs_settings_id  = ?";

    $stmt = $conn->prepare($updateQuery);
    $stmt->bind_param("isi", $cs_settings_value,  $cs_settings_unit, $cs_settings_id);

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Settings saved successfully.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to save data.';
    }
} else if ($type === "save_cms") {
    $email = $_POST["email"];
    $address = $_POST["address"];
    $cp1 = $_POST["cp1"];
    $cp2 = $_POST["cp2"];
    $cp3 = $_POST["cp3"];
    $company_name = $_POST["company_name"];
    $acknowledgement = $_POST["acknowledgement"];
    $disclaimer = $_POST["disclaimer"];

    $updateQuery = "UPDATE cs_cms 
                    SET cms_email = ?, cms_address = ?, cms_cp1 = ?, cms_cp2 = ?, cms_cp3 = ?, cms_company_name = ?, cms_acknowledgement = ?, cms_disclaimer = ?
                    WHERE cms_id = 1";
    $stmt = $conn->prepare($updateQuery);
    $stmt->bind_param("ssssssss", $email, $address, $cp1, $cp2, $cp3, $company_name, $acknowledgement, $disclaimer);

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'CMS successfully updated.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to update data.';
    }
} else if ($type === "save_vat" || $type === "add_payment" || $type === "update_payment" || $type === "delete_payment") {

    if ($type === "save_vat") {
        $vat = $_POST["vat"];
        $vat_name = $_POST["vat_name"];


        $updateQuery = "UPDATE cs_settings 
                    SET cs_settings_value = ?, cs_settings_unit = ?
                    WHERE cs_settings_id  = 2";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("is", $vat, $vat_name);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Vat successfully updated.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to update Vat.';
        }
    } else if ($type === "add_payment") {
        $new_payment = $_POST["new_payment"];
        $new_cf = $_POST["new_cf"];


        $insertQuery = "INSERT INTO cs_mop 
                            (cs_mop_name, cs_mop_fee)
                            VALUES (?, ?)";
        $stmt = $conn->prepare($insertQuery);
        $stmt->bind_param("si", $new_payment, $new_cf);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'MOP successfully added.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to add MOP.';
        }
    } else if ($type === "update_payment") {
        $cs_mop_id = $_POST["cs_mop_id"];
        $cs_mop_name = $_POST["cs_mop_name"];
        $cs_mop_fee = $_POST["cs_mop_fee"];

        $updateQuery = "UPDATE cs_mop
                        SET cs_mop_name = ?, cs_mop_fee = ?
                        WHERE cs_mop_id = ?";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("sii", $cs_mop_name, $cs_mop_fee, $cs_mop_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'MOP successfully updated.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to update MOP.';
        }
    } else if ($type === "delete_payment") {
        $cs_mop_id = $_POST["cs_mop_id"];


        $softDeleteQuery = "UPDATE cs_mop SET isDeleted = 1 WHERE cs_mop_id = ?";
        $stmt = $conn->prepare($softDeleteQuery);
        $stmt->bind_param("i", $cs_mop_id);

        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'MOP successfully deleted.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Failed to delete MOP.';
        }
    }
} else if ($type === "payment_delete") {
    $cs_p_id = $_POST["cs_p_id"];

    $softDeleteQuery = "DELETE FROM cs_payment WHERE cs_p_id = ?";
    $stmt = $conn->prepare($softDeleteQuery);
    $stmt->bind_param("i", $cs_p_id);

    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Payment successfully deleted.';
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Failed to delete payment.';
    }
} else {
    $response = array("status" => "error", "message" => "Invalid type");
    echo json_encode($response);
    exit();
}

$conn->close();

echo json_encode($response);
