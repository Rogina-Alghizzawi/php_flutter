<?php
// include("C:\\xampp\\htdocs\\graduation\\database.php");

// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
// header("Access-Control-Allow-Headers: *");

// // Start or resume a session
// session_start();





// try {
//     // Check if the required fields are set and not empty
//     if (
//         isset($_POST["username"]) &&
//         isset($_POST["password"]) &&
//         !empty($_POST["username"]) &&
//         !empty($_POST["password"])
//     ) {
//         $username = $_POST["username"];
//         $password = $_POST["password"];

//         // Prepare the SQL statement to fetch user by username and password
//         $stmt = $con->prepare("
//             SELECT * FROM paysimdatabase WHERE username = ? AND password = ?
//         ");

//         // Execute the statement with the parameters
//         $stmt->execute([$username, $password]);

//         // Fetch the user
//         $user = $stmt->fetch(PDO::FETCH_ASSOC);

//         // Check if a user was found
//         if ($user) {
//             // Cast 'newbalance' to a float (adjust casting based on the actual data type)
//             $user['newbalance'] = floatval($user['newbalance']);

//             // Store user information in the session
//             $_SESSION['user'] = $user;

//             echo json_encode(array("status" => "success", "user" => $user));
//         } else {
//             echo json_encode(array("status" => "fail", "message" => "Invalid username or password."));
//         }

//         // Exit here if the login fails
//         exit;
  
   

//     }
    

// } catch (PDOException $e) {
//     echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
// }

include("C:\\xampp\\htdocs\\graduation\\database.php");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: *");

// Start or resume a session
session_start();

try {
    // Check if the required fields are set and not empty
    if (
        isset($_POST["username"]) &&
        isset($_POST["password"]) &&
        !empty($_POST["username"]) &&
        !empty($_POST["password"])
    ) {
        $username = $_POST["username"];
        $password = $_POST["password"];

        // Prepare the SQL statement to fetch user by username and password
        $stmt = $con->prepare("
            SELECT * FROM paysimdatabase WHERE username = ? AND password = ?
        ");

        // Execute the statement with the parameters
        $stmt->execute([$username, $password]);

        // Fetch the user
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Check if a user was found
        if ($user) {
            // Cast 'newbalance' to a float (adjust casting based on the actual data type)
            $user['newbalance'] = floatval($user['newbalance']);

            // Store user information in the session
            $_SESSION['user'] = $user;

            echo json_encode(array("status" => "success", "user" => $user));
        } else {
            echo json_encode(array("status" => "fail", "message" => "Invalid username or password."));
        }
    } else {
        echo json_encode(array("status" => "fail", "errorFields" => ["username", "password"]));
    }
} catch (PDOException $e) {
    echo json_encode(array("status" => "fail", "error" => $e->getMessage()));
}

?>

