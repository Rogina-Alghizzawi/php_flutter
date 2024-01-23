<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");

// Include database connection file
include("C:\\xampp\\htdocs\\graduation\\database.php");

// Start or resume a session
session_start();

try {
    // Check if the required fields are set and not empty
    if (
        isset($_POST["username"]) &&
        isset($_POST["password"]) &&
        isset($_POST["phonenumber"]) &&
        !empty($_POST["username"]) &&
        !empty($_POST["password"]) &&
        !empty($_POST["phonenumber"])
    ) {
        $username = $_POST["username"];
        $password = $_POST["password"];
        $phonenumber = $_POST["phonenumber"];

        // Prepare the SQL statement to check if the username already exists
        $checkUsernameStmt = $con->prepare("SELECT * FROM paysimdatabase WHERE username = ?");
        $checkUsernameStmt->execute([$username]);

        if ($checkUsernameStmt->rowCount() > 0) {
            // Username already exists
            echo json_encode(array("status" => "fail", "message" => "Username already exists."));
        } else {
            // Username is available, proceed with registration

            // Prepare the SQL statement to insert a new user
            $insertStmt = $con->prepare("INSERT INTO paysimdatabase (username, password, phonenumber) VALUES (?, ?, ?)");
            $insertStmt->execute([$username, $password, $phonenumber]);

            // Check if the insertion was successful
            if ($insertStmt->rowCount() > 0) {
                // Fetch the newly inserted user
                $user = $con->lastInsertId(); // Change this based on your database structure

                // Store user information in the session
                $_SESSION['user'] = $user;

                echo json_encode(array("status" => "success", "user" => $user));
            } else {
                echo json_encode(array("status" => "fail", "message" => "Failed to register user."));
            }
        }
    } else {
        echo json_encode(array("status" => "fail", "errorFields" => ["username", "password", "phonenumber"]));
    }
} catch (PDOException $e) {
    echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}
?>
