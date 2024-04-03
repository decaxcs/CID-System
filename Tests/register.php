<?php
include_once "connect_database.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Encrypt the password
    $encrypted_password = password_hash($password, PASSWORD_DEFAULT);

    $query = "INSERT INTO cs_users (csu_username, csu_password) VALUES (?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $username, $encrypted_password);

    if ($stmt->execute()) {
        echo "Account created successfully";
    } else {
        echo "Failed to create account";
    }
} else {
    echo "Invalid request method";
}
?>
