<?php

class parser {

    var $url;
    var $content;
    var $products;
    var $productUrl;

    function __construct($url) {
        $this->url = $url;
        //echo 'Текущий путь: ' . $this->url . '<br>';
    }

    function createParser($path) {
        if (!require_once $path) {
            return false;
        } else {
            return true;
        }
    }

    function getContent() {
        $this->content = file_get_contents($this->url);
        return true;
    }

    function __get($name) {
        return $this->$name;
    }

    function __set($name, $value) {
        $this->$name = $value;
    }

    function saveImg($url) {
        $path = pathinfo($url);
        $new = "img/{$path['basename']}";
        $copy = copy($url,$new);
        if ($copy){
            $status = $new;
        } else {
            $status = 'error';
        }
        return $status;
    }
    
    function getTd($element){
        return '<td>'.$element.'</td>';
    }

}
