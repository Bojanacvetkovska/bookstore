<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php include ("navbar.php");
?>
<?php
    if (isset($_POST["login"])) {
        $email = $_POST["email"];
        $password = $_POST["password"];

        require_once "dbaccess.php";
        
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
    <div class="container">
        <form id="loginForm">
            <div class="form-group">
                <input type="email" placeholder="Enter Email:" name="email" id="email" class="form-control"/>
            </div>
            <div class="form-group">
                <input type="password" placeholder="Enter Password:" name="password" id="password" class="form-control"/>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="remember" id="remember" />
                <label class="form-check-label" for="remember">Remember Me</label>
            </div>


            <div class="form-btn">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
         
        </form>
        <div>
            <p>Not registered yet <a href="registration.php">Register Here</a></p>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="login.js"></script>
</body>
</html>
