$(document).ready(function() {
    console.log(document.cookie);
    displayprodukte();

});

function setCookie(product){

    var cartProducts = getCardProducts();

    cartProducts.push(product);

    

    setCartProducts(cartProducts);

    console.log(document.cookie);

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

function displayprodukte(){
    var cart = getCardProducts();
    var counter = 0;

    var productCounts ={};

    var uniqueProducts =[];

    for(var i = 0; i < cart.length; i++){
        var innerArray = cart[i];

        if(innerArray.length >0){
            var product = innerArray[0];
            var productId = product.id;
            
            if(productCounts[productId]){
                productCounts[productId]++;
            }else{
                productCounts[productId] = 1;
                uniqueProducts.push(cart[i]);
            }
        }
    }

    for(var i = 0; i < uniqueProducts.length; i++){
        counter++;
        var innerArray2 = cart[i];

        if(innerArray2.length >0){
            var product = innerArray2[0];
            var productpreis = product.preis*productCounts[product.id];
            $("#produkteWarenkorb").append('<p><img with = 80px height = 130px src = "./res/img/produktBilder/'+product.image_url+'"><b>'+product.name+'</b> Anzahl: '+productCounts[product.id]+' Preis: '+productpreis+'€</p>');
        }
    }

    
        
       
    
    
}