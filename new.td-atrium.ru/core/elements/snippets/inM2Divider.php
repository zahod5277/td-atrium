<?php

if ((isset($inM2)) && (isset($price))){
    if (($inM2 > 0) && ($price > 0)){
        $price = str_replace(' ', '', $price);
        $output = round($price/$inM2);
    } else {
        $output = 'Неверные значения цены или количества';
    }
} else {
    $output = 'Невозможно рассчитать';
}
return $output;