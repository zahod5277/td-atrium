<?php

//Плагин для обработки цен товаров
switch ($modx->event->name) {
    case 'msOnBeforeAddToCart':
        $product_id = $_POST['id'];
        $page = $modx->getObject('msProduct', $product_id);
        $price_eu = $page->get('price_eu');
        $price = $page->get('price');
        if ($price == 0 || $price == '') {
            if ($price_eu != '') {
                if (!$currencyrate = $modx->getService('currencyrate', 'currencyrate', $modx->getOption('currencyrate_core_path', null, $modx->getOption('core_path') . 'components/currencyrate/') . 'model/currencyrate/', $scriptProperties)) {
                    return 'Could not load currencyrate class!';
                }
                $product->set('price', $price_eu*60);
            }
        }
        break;
}