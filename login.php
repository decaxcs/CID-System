<?php
include_once "connect_database.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $query = "SELECT * FROM cs_users WHERE csu_username = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if (password_verify($password, $row['csu_password'])) {
            session_start();
            $_SESSION["username"] = $username;

            echo json_encode(array("status" => "success", "permission" => $row['csu_permission']));
        } else {
            echo json_encode(array("status" => "failed"));
        }
    } else {
        echo json_encode(array("status" => "failed"));
    }
} else {
    header("Location: login_page.php");
    exit();
}
?>
