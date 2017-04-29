<?php
$pdo = $modx->getService('pdoTools');
if ($product = $modx->getObject('msProduct', $id)) {
    $output = $pdo->runSnippet('msProducts',array(
        'includeContent' => 1,
        'resources' => $id,
        'limit' => 1,
        'tpl' => '@FILE:chunks/product/quickView.tpl'
    ));
} else {
    $output = '<h2>Невозможно загрузить страницу</h2>';
}

return $output;
