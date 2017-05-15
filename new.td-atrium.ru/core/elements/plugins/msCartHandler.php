<?php

//Плагин для обработки цен товаров
switch ($modx->event->name) {
    case 'msOnBeforeAddToCart':
        $product_id = $_POST['id'];
        $page = $modx->getObject('msProduct', $product_id);
        $price_eu = $page->get('price_eu');
        $unit = $page->get('unit');
        $price = $page->get('price');
        if ($price == 0 || $price == '') {
            if ($price_eu != '') {
                if (!$currencyrate = $modx->getService('currencyrate', 'currencyrate', $modx->getOption('currencyrate_core_path', null, $modx->getOption('core_path') . 'components/currencyrate/') . 'model/currencyrate/', $scriptProperties)) {
                    return 'Could not load currencyrate class!';
                }
                $list = $currencyrate->getList();
                $multiplier = $list['EUR'];
                $price = $currencyrate->formatPrice(($price_eu * $multiplier), $format, $noZeros);
                $price = round($price, 2);
            }
        }
        if ($unit == 'м.кв.') {
            $inM2 = $page->get('inM2');
            $price_eu = round($price / $inM2, 2);
        } else {
            $price_eu = $price;
        }
        $product->set('price', $price_eu);
        break;
}