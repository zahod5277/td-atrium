<?php

if ((isset($inM2)) && (isset($price))){
    if (($inM2 > 0) && ($price > 0)){
        $price = str_replace(' ', '', $price);
        $output = $price/$inM2;
    } else {
        $output = 0;
    }
} else {
    $output = 'Невозможно рассчитать';
}
return $output;