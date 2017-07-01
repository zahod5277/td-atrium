<?php

define('MODX_API_MODE', true);
require $_SERVER["DOCUMENT_ROOT"] . '/index.php';
$modx->getService('error', 'error.modError');
include 'processor.php';

$processor = new pirProcessor($modx);

$query = "SELECT col.`id` AS `col_col_id`,
col.`collection_id` AS `col_collection_id`,
col.`name` AS `col_col_name`,
col.`brand` AS `col_col_brand`,
col.`country` AS `col_col_country`, 
col.`interior` AS `col_col_interior`,
col_el.`id` AS `col_el_id`,
col_el.`collection` AS `col_el_collection`, 
col_el.`product` AS `col_el_product`,
el.`code` AS `el_code`,
el.`name` AS `el_name`,
el.`price` AS `el_price`,
el.`rmprice` AS `el_rmprice`,
el.`edizm` AS `el_edizm_edizm`,
el.`category` AS `el_category`,
el.`field_of_application_list` AS `el_application`,
el.`place_in_the_collection` AS `el_place`,
el.`size` AS `el_size`,
el.`BaseValue` AS `el_BaseValue`,
el.`CoverValue` AS `el_CoverValue`,
el.`pic` AS `el_pic`,
el.`SurfaceValue` AS `el_surface`
FROM `collection` col 
	LEFT JOIN `collection_element` col_el ON (col.`id` = col_el.`collection`)
    LEFT JOIN `element` el ON (col_el.`product` = el.`id`)
    LIMIT 100";

$result = $modx->query($query);
$i = 0;

if (!is_object($result)) {
    return 'No result!';
} else {
    echo '<table>';
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo '<p>' . $i . '</p>';
        //Проверяем, существует ли такой производитель в базе данных
        $vendor = $row['col_col_brand'];
        $checkVendor = $processor->checkVendor($vendor);
        //Проверяем, существует ли такая коллекция в базе
        $collection = $row['col_collection_id'];
        $checkCollection = $processor->checkCollection($collection);
        //Если производитель не сущесвует, то создаем. Если существует - получаем его ID
        if ($checkVendor != false) {
            $vendor_id = $checkVendor;
            echo '<b>Производитель есть: </b>' . $vendor_id . '<br>';
        } else {
            $vendor_id = $processor->createVendor($vendor);
            echo '<b>Производителя нет: </b>' . $vendor_id . '<br>';
        }
        //Проверяем, если в нужном нам каталоге (плитка, керамогранит или мозаика)
        //ресурс с таким же Vendor id, чтобы загрузить туда коллекции
        if ($row['el_category'] == '') {
            $row['el_category'] = 'Плитка';
        }
        $category = $processor->resourceTree[$row['el_category']];
        $category = 4692;
        if ($checkCollection != 'empty') {
            echo '<b>Коллекция есть</b><br>';
            echo '<b>Будем создавать товары</b><br>';
            $size = $processor->productSizeFormatter($row['el_size']);

            $productProperties = [
                'price' => $row['el_price'],
                'article' => $row['el_code'],
                'pagetitle' => $row['el_name'],
                'unit' => $row['el_edizm'],
                'made_in' => $row['col_col_country'],
                'color' => '',
                'collection' => $row['col_col_name'],
                'inM2' => '',
                'quantity' => '',
                'box' => '',
                'primenenie' => '',
                'weight' => '',
                'width' => $size[0],
                'length' => $size[1],
                'vendor' => $vendor_id,
                'category' => $row['el_category'],
                'surface' => $row['el_surface'],
                'distibutor' => 'piranesi',
                'kafelType' => $row['el_place']
            ];
            //такая коллекция есть, не надо создавать ресурс
        } else {
            echo '<b>Коллекции нет, проверяем производителя</b><br>';
            $vendorParent = $processor->getVendorResource($vendor_id, $category);
            if (!is_null($vendorParent)) {
                echo '<b>За производителем ' . $vendor_id . ' в категории: ' . $category . ' есть ресурс ' . $vendorParent . '</b><br>';
            } else {
                $vendor = $modx->getObject('msVendor', $vendor_id);
                $vendor_name = $vendor->get('name');
                $properties = [
                    'pagetitle' => $vendor_name,
                    'alias' => $this->createAlias($vendor_name) . '-' . $vendor_id,
                    'published' => 1,
                    'template' => 3,
                    'parent' => $category,
                    'class_key' => 'msCategory',
                    'tvs' => true,
                    'tv3' => $vendor_id
                ];
                $response = $this->createDocument($properties);
                $vendorResponse = $processor->createDocument($vendor_id, $category);
                echo '<h1>' . var_dump($vendorResponse->get('id')) . '</h1>';
                echo '<b>Создана категория для производителя ' . $vendor_id . ' в категории: ' . $category . '</b><br>';
                var_dump($vendorParent);
            }
            $int = $processor->getInterior($row);
            $pageProperties = [
                'pagetitle' => $row['col_col_name'],
                'tvs' => true,
                'class_key' => 'msCategory',
                'published' => 1,
                'alias' => $processor->createAlias($row['col_col_name']),
                'template' => 3,
                'tv1' => $int,
                'tv2' => $row['col_collection_id'],
                'parent' => $vendorParent
            ];

            echo '<b>будет создана категория с параметрами:</b><br> ';
            $categoryResponse = $processor->createDocument($pageProperties);
            $categoryId = $categoryResponse->get('id');
            echo '<b>Создана категория: </b>' . $categoryId;
        }
        echo '<hr>';
        $i++;
    }
    echo '</table>';
}
