<?php
// database_config.php

$host = "localhost";
$dbname = "graduation_project";
$username = "root";
$password = "Fk9VxY9L8WCqqszz";

try {
    $dsn = "mysql:host=$host;dbname=$dbname";
    $con = new PDO($dsn, $username, $password);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>

