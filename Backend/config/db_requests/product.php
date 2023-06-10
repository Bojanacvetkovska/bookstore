<?php
class Product
{
    public $id;
    public $name;
    public $image_url;
    public $preis;

    function __construct($id, $name, $image_url, $preis)
    {
        $this->id= $id;
        $this->name = $name;
        $this->image_url = $image_url;
        $this->preis = $preis;
    }
}
?>