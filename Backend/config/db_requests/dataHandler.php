<?php
include("product.php");
class DataHandler{

    public function getAllProducts(){
        require("db_getAllProducts.php");
        $result = array();
        foreach ($res as $line)
        {
            array_push($result, new Product(
                $line["pr_id"],
                $line["pr_title"],
                $line["pr_bild"],
                $line["pr_preis"]
            ));
        }
        return $result;
    }

    public function getKatProducts($param){
        require("db_getKatProducts.php");
        $result = array();
        foreach ($res as $line)
        {
            array_push($result, new Product(
                $line["pr_id"],
                $line["pr_title"],
                $line["pr_bild"],
                $line["pr_preis"]
            ));
        }
        return $result;
    }

    public function  getTitleProducts($param){
        require("db_getTitleProducts.php");
        $result = array();
        foreach ($res as $line)
        {
            array_push($result, new Product(
                $line["pr_id"],
                $line["pr_title"],
                $line["pr_bild"],
                $line["pr_preis"]
            ));
        }
        return $result;
    }

    public function  getIDProduct($param){
        require("db_getIDProducts.php");
        $result = array();
        foreach ($res as $line)
        {
            array_push($result, new Product(
                $line["pr_id"],
                $line["pr_title"],
                $line["pr_bild"],
                $line["pr_preis"]
            ));
        }
        return $result;
    }


    

    
}