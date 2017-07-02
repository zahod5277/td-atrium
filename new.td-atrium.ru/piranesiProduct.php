<?php

define('MODX_API_MODE', true);
require 'index.php'; // Этот файл лежит в корне сайта
set_time_limit(600);
$modx->getService('error', 'error.modError');
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->setLogTarget(XPDO_CLI_MODE ? 'ECHO' : 'HTML');

$resourceTree = [
    'Плитка' => 3,
    'Керамогранит' => 4,
    'Мозаика' => 3173,
    'Не определено' => 888885
];

$result = $modx->query("SELECT col.`id` AS `col_col_id`,
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
    LIMIT 10");
if (!is_object($result)) {
    return 'No result!';
} else {
    echo '<table>';
    while ($row = $result->fetchAll(PDO::FETCH_ASSOC)) {
        $process = processProducts($row,$modx);
//        echo '<tr>';
//        echo '</tr>';
    }
    echo '</table>';
    var_dump($process);
}

function checkCollection($tvValue) {
    $query = $modx->newQuery('modResource');
    $query->leftJoin('modTemplateVarResource', 'TV', 'TV.contentid = modResource.id');
    $query->where([
        'TV.tmplvarid' => 2,
        'TV.value' => $tvValue
    ]);
    $query->prepare();
    //return $query->toSQL();
    $query->stmt->execute();
    $ids = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
    if (count($ids)) {
        foreach ($ids as $id) {
            $output[]['id'] = $id['modResource_id'];
        }
    } else {
        $output = 'empty';
    }
    return $output;
}

function processProducts($row){
    $collection = $row['col_collection_id'];
    //Проверяем, есть ли уже такая коллекция
    $checkCollection = checkCollection($collection, $modx);
    if (is_array($checkCollection)) {
        //такая коллекция есть, не надо создавать ресурс
        if ($row['el_category'] == '') {
            $row['el_category'] = 'Плитка';
        }
        $parent = $resourceTree[$row['el_category']];
    } else {
        $int = getInterior($row);
        //создаем ресурс с коллекцией
//        $alias = $page->cleanAlias($row['col_col_name']);
//        $response = $modx->runProcessor('resource/create', [
//            'pagetitle' => $row['col_col_name'],
//            'tvs' => true,
//            'class_key' => 'msCategory',
//            'published' => 1,
//            'alias' => $alias,
//            'template' => 3,
//            'tv1' => $int,
//            'parent' => 4692
//        ]);
//        if ($response->isError()) {
//            return $modx->error->failure($response->getMessage());
//        }
//        return $response;
    }
}

function getFileByFTP($file) {
    $basename = basename($file);
    $filename = 'files/' . $basename;
    $rawFile = file_get_contents($row['col_col_interior']);
    file_put_contents($filename, $rawFile);
    return $filename;
}

function getInterior($row){
    if ($row['col_col_interior'] != '') {
            $file = 'files/' . basename($row['col_col_interior']);
//            echo 'Проверяем, есть ли файл ' . $file . '<br>';
            if (!file_exists($file)) {
                $filename = getFileByFTP($row['col_col_interior']);
//                echo 'файла не было, скачали<br>';
            } else {
                $filename = $file;
//                echo 'файл существует, пропускаем<br>';
            }
        }
    return $filename;
}