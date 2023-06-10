<!DocTYPE html>
<html lang="de">

<head>
	<title>Produkte</title>
	<link rel="stylesheet" href="res/css/styleproduct.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


    
</head>
<body>
<?php include 'navbar.php'; ?>

<br>

<div class="row">
    <div class="col-sm"></div>
    <div class="col-sm-9">
        <div class="input-group">
            <input type="text" class="form-control" id="seachfield" placeholder="Search via title">
			<select id="kategorie" >
                <option>Fachliteratur</option>
                <option>Fantasy & Science Fiction</option>
                <option>Fremdsprachig</option>
                <option>Krimis & Thriller</option> 
				<option>Manga</option>
                <option selected>Romane</option> 
            </select>
            <img id= "warenkorb" src="./res/img/warenkorbicon.jpg" with = "40px" height = "40px">
            <p id="warenAnzahl" style = "font-size:25px;"><b>0</b></p>
        </div>
    </div>
    <div class="col-sm"></div>
</div>


<br>	

<div class="container">
    <div class="row" id= "produktBereich">
        
        
    </div>
</div>
<hr>


<script src="produkt.js" type="text/javascript"></script>
</body>
</html>
