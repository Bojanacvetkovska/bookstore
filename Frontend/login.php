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
<?php
 include ("navbar.php");
 if (isset($_SESSION['user'])) { 
    header("Location: index.php");
 }
    else{
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
            <p>Not registered yet <a href="registrierung.php">Register Here</a></p>
        </div>
    </div>

<?php } ?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="login.js"></script>
</body>
</html>
