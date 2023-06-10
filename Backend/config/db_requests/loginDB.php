<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
    if (isset($_POST["login"])) {
        $email = $_POST["email"];
        $password = $_POST["password"];

        require_once "dbacess.php";
        
        // Ensure to use parameterized queries or prepared statements to prevent SQL injection.
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $user = $result->fetch_assoc();

            if ($user) {
                if (password_verify($password, $user["password"])) {
                    session_start();
                    $_SESSION["user"] = "yes";
                    // Instead of redirecting with PHP, we're returning a JSON response.
                    echo json_encode(['success' => true]);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Password does not match']);
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Email not found']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Query execution failed']);
        }
        
        $stmt->close();
        $conn->close();
    }
?>
