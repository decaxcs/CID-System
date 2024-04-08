<?php
session_start();

if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
    unset($_SESSION["loggedin"]);
    session_regenerate_id(true);
    header("Location: ../index.php");
    exit;
}
?>
