<?php
session_start();
include_once "connect_database.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = htmlspecialchars($_POST["username"]);
    $password = $_POST["password"];

    // Check if the username exists and if the account is not deleted
    $query = "SELECT * FROM cs_users WHERE csu_username = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['isDeleted'] == 1) {
            // Account is deleted
            echo json_encode(array("status" => "deleted"));
        } elseif (password_verify($password, $row['csu_password'])) {
            // Successful login
            $_SESSION["login"] = true;
            $_SESSION["username"] = $username;
            $_SESSION["csu_id"] = $row['csu_id'];

            // Insert login action into logs
            $user_id = $row['csu_id'];
            $action = 'login';
            $table_name = 'cs_users';
            $record_id = $user_id;
            $cid_number = null; // or you can assign it if needed
            $log_query = "INSERT INTO logs (user_id, action, table_name, record_id, cid_number) VALUES (?, ?, ?, ?, ?)";
            $log_stmt = $conn->prepare($log_query);
            $log_stmt->bind_param("issis", $user_id, $action, $table_name, $record_id, $cid_number);
            $log_stmt->execute();

            $login_query = "UPDATE login_account SET user_id = ? WHERE id = 1";
            $login_stmt = $conn->prepare($login_query);
            $login_stmt->bind_param("i", $user_id);
            $login_stmt->execute();

            echo json_encode(array("status" => "success", "permission" => $row['csu_permission']));
        } else {
            // Incorrect password
            echo json_encode(array("status" => "failed"));
        }
    } else {
        // Username not found
        echo json_encode(array("status" => "no_user"));
    }
} else {
    header("Location: login_page.php");
    exit();
}
