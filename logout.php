<?php
session_start();
include_once "connect_database.php";

if (isset($_SESSION["csu_id"])) {
    // Insert logout action into logs
    $user_id = $_SESSION["csu_id"];
    $action = 'logout';
    $table_name = 'cs_users';
    $record_id = $user_id;
    $cid_number = null; // or you can assign it if needed
    $log_query = "INSERT INTO logs (user_id, action, table_name, record_id, cid_number) VALUES (?, ?, ?, ?, ?)";
    $log_stmt = $conn->prepare($log_query);
    $log_stmt->bind_param("issis", $user_id, $action, $table_name, $record_id, $cid_number);
    $log_stmt->execute();
}

$_SESSION = array();

if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

session_destroy();

header("Location: index.php");
exit;
?>
