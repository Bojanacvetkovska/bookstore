<head>
    <meta charset="UTF-8">
    <html lang="de">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<?php
session_start();
?>

<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="impressum.php">Impressum</a>
                </li>
                <?php
                //Je nach dem ob anonym/user/admin werden unterschiedliche Links gezeigt darüber sind die Links die allen gezeigt werden
                if (isset($_SESSION['user'])) { 
                    echo'
                    <li class="nav-item">
                        <a class="nav-link" href="produkte.php">Produkte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userbestellungen.php">Bestellungen</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="meinKonto.php">Mein Konto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php">Logout</a>
                    </li>';
                } else if(isset($_SESSION['admin'])){
                    echo'
                    <li class="nav-item">
                        <a class="nav-link" href="produktVerwaltung.php">Produkte verwalten</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userverwaltung.php">Userverwaltung</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="gutscheine.php">Gutscheine verwalten</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php">Logout</a>
                    </li>';
                } else{
                    echo'
                    <li class="nav-item">
                        <a class="nav-link" href="produkte.php">Produkte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registrierung.php">Registrierung</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.php">Login</a>
                    </li>';
                }?>
            </ul>
        </div>
    </div>
    <?php 
    if(isset($_SESSION['user'])){
        echo " <p class='fs-6 text-end'> Willkommen, ".$_SESSION['user']." </p>";
    } else if(isset($_SESSION['admin'])){
        echo " <p class='fs-6 text-end'> Willkommen, ".$_SESSION['admin']." </p>";
    }
    ?>
</nav>
