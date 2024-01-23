<?php
include("C:\\xampp\\htdocs\\graduation\\database.php");
include("C:\\xampp\\htdocs\\graduation\\transaction.php");

session_start(); // Ensure session is started

try {
    if (isset($_SESSION['transaction'])) {
        // // Extract transaction data from session
        $_SESSION['transaction_username'] = $username;
        $_SESSION['transaction_Amount'] = $Amount;
        $_SESSION['transaction_recipient'] = $recipient;

        // //  Update balances for sender and recipient

        $SenderAmount = $usernameUser['Amount'] + $Amount;

        $senderNewBalance = $usernameUser['newbalance'] - $Amount;
        $recipientNewBalance = $recipientUser['newbalance'] + $Amount;


        $updateSenderStmt = $con->prepare("UPDATE paysimdatabase SET newbalance = ?,Amount =? WHERE username = ?");
        $updateSenderStmt->execute([ $senderNewBalance,$Amount,$username]);

        $updateRecipientStmt = $con->prepare("UPDATE paysimdatabase SET newbalance = ? WHERE username = ?");
        $updateRecipientStmt->execute([$recipientNewBalance, $recipient]);

        // Respond with a success message
        echo json_encode(array("status" => "success", "message" => "Transaction successful."));
    } else {
        // Handle the case where session data is not set
        echo json_encode(array("status" => "fail", "message" => "Transaction data not found in session."));
    }
} catch (PDOException $e) {
    // Handle any exceptions
    echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}
?>
