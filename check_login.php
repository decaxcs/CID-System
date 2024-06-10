<?php
session_start();
if (!isset($_SESSION["login"])) {
    header("Location: /CID-System/index.php");
    exit();
}
?>