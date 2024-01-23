<?php
include("C:\\xampp\\htdocs\\graduation\\database.php");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: *");


session_start(); // Start the session



try {
    if (isset($_POST["username"]) && isset($_POST["Amount"]) && isset($_POST["recipient"])) {

        $username = $_POST["username"];
        $_SESSION['transaction_username'] = $username;

        $Amount = $_POST["Amount"];
        $_SESSION['transaction_Amount'] = $Amount;

        $recipient = $_POST["recipient"];
        $_SESSION['transaction_recipient'] = $recipient;
        
        $usernameStmt = $con->prepare("SELECT * FROM paysimdatabase WHERE username = ?");
        $usernameStmt->execute([$username]);
        $usernameUser = $usernameStmt->fetch(PDO::FETCH_ASSOC);

        // Check if the recipient exists in the database
        $recipientStmt = $con->prepare("SELECT * FROM paysimdatabase WHERE username = ?");
        $recipientStmt->execute([$recipient]);
        $recipientUser = $recipientStmt->fetch(PDO::FETCH_ASSOC);

        if ($recipientUser && $usernameUser) {
           $response = array(
            "status" => "success", 
            "message" => "Transaction successful.",
            "sessionData" => array(
                "username" => $_SESSION['transaction_username'] ?? 'Not set',
                "Amount" => $_SESSION['transaction_Amount'] ?? 'Not set',
                "recipient" => $_SESSION['transaction_recipient'] ?? 'Not set'
            )
        );

            header('Content-Type: application/json');
            echo json_encode(array("status" => "success", "message" => "Transaction successful."));
            exit;
        } else {
            echo json_encode(array("status" => "fail", "message" => "Recipient not found in the database."));
        }
 
    } else {
        echo json_encode(array("status" => "fail", "errorFields" => ["Amount", "recipient"]));
    }
} catch (PDOException $e) {
    echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}

   // } elseif (isset($_POST["blockRecipient"])) {
    //     // Add recipient to blocked list (logic to be implemented)

    //     // Output JSON response
    //     header('Content-Type: application/json');
    //     echo json_encode(array("status" => "success", "message" => "Recipient added to the blocked list."));
    //     exit;
?>