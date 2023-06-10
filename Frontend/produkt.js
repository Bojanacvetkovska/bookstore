$(document).ready(function() {

    console.log(document.cookie);

    ajaxHandler("getKatProducts","3", displayProducts);

    $("#seachfield").on("input", function(e){
        $("#produktBereich").hide();
        $("#produktBereich").empty();
        ajaxHandler("queryBookTitle", $("#seachfield").val(), displayProducts);
        $("#produktBereich").show();
    });

    $("#warenkorb").on("click", function(e){
        window.location.href = "warenkorb.php";
    });

    

    $("#kategorie").on("change", function(e){
        var selectedCategory = document.getElementById("kategorie").value;
        var intKat = "3";
        if(selectedCategory === "Fachliteratur"){
            intKat = "2";
        }else if(selectedCategory === "Fantasy & Science Fiction"){
            intKat = "5";
        }else if(selectedCategory === "Fremdsprachig"){
            intKat = "4";
        }else if(selectedCategory === "Krimis & Thriller"){
            intKat = "7";
        }else if(selectedCategory === "Manga"){
            intKat = "6";
        }else if(selectedCategory === "Romane"){
            intKat = "3";
        }
        $("#produktBereich").hide();
        $("#produktBereich").empty();
        ajaxHandler("getKatProducts",intKat, displayProducts);
        $("#produktBereich").show();
    });

    $(document).on('click', '.add-to-cart', function(){
        var elementId = $(this).attr('id');
        addtoCart(elementId);
    });

    setWarenkorbAnzahl();

    
   
    
})

function setWarenkorbAnzahl(){

    var finalProducts = getCardProducts();

    var counter = 0;

    finalProducts.forEach(element =>{
        counter++;
        console.log(counter);
    });

    

    $("#warenAnzahl").html(counter);
}



function addtoCart(elementId){
    console.log(elementId);
    getProductById(elementId);
}

function getProductById(elementId){
    ajaxHandler("getProductbyID", elementId, setCookie);
}

function setCookie(product){

    var cartProducts = getCardProducts();

    cartProducts.push(product);

    

    setCartProducts(cartProducts);

    console.log(document.cookie);

    setWarenkorbAnzahl();
}

function getCardProducts(){
    var cookieValue = document.cookie
        .split("; ")
        .find(row => row.startsWith("cartProducts="));

        if(cookieValue) {
            var productsJson = cookieValue.split("=")[1];
            return JSON.parse(productsJson);
        }else{
            return[];
        }
}

function setCartProducts(products){
    var productsJSON = JSON.stringify(products);
    document.cookie = "cartProducts=" + productsJSON +"; path=/"
}

function displayProducts(products){
    products.forEach(element =>{
        $("#produktBereich").append('<div class="col-md-3 col-sm-6"><div class="product-grid2"><div class="product-image2"><a href="#"><img class="pic-1" src="./res/img/produktBilder/'
        + element.image_url +
        '"><img class="pic-2" src="./res/img/produktBilder/'
        + element.image_url +
        '"></a></a></li></ul><a id = "'+element.id+'" class="add-to-cart" >Add to cart</a></div><div class="product-content"><h3 class="title"><a href="#">'
        + element.name+
        '</a></h3><span class="price">'
        + element.preis+
        '€</span></div></div></div>')
    });
}




function ajaxHandler(method, searchterm, nextFunc = ()=>{}){

    $.ajax({
        type: "GET",
        url: "../Backend/serviceHandler.php",
        cache: false,
        data:{method: method, param: searchterm},
        dataType: "json",
        success: function(response){
            console.log(response);
            nextFunc(response);
        },
        error: function(xhr){
            console.log(6);
            console.log(xhr);
            alert('Error, ein Problem ist aufgetreten: '+xhr.responseText);
        }
    });
}