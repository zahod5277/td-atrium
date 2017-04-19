<?php
//Плагин для обработки цен товаров
switch ($modx->event->name) {
    case 'msOnBeforeAddToCart':
    $product_id = $_POST['id'];
    $page = $modx->getObject('msProduct',$product_id);
    die($page->get('price_eu'));
    $product->set('new_price', 5555);
    break;
}