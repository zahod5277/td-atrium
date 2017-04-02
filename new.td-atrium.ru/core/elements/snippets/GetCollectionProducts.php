<?php
$pdo = $modx->getService('pdoTools');
$tplOuter = '@FILE:chunks/collection/collectionOuter.tpl';
$tplType = '@FILE:chunks/collection/typeTpl.tpl';
$tpl = '@FILE:chunks/collection/collectionProduct.tpl';
$query = $modx->newQuery('msProductData');
$query->leftJoin('modResource', 'modResource', 'modResource.id = msProductData.id');
$query->select('`msProductData`.`kafelType`');
$query->where(array(
  'modResource.parent' => $collectionId
));
$query->distinct();
$query->prepare();
//return $query->toSQL();
$query->stmt->execute();
$kafels = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($kafels as $kafel){
    $products = $pdo->runSnippet('msProducts',array(
        'parents' => $collectionId,
        'where' => '{"Data.kafelType:=":"'.$kafel['kafelType'].'"}',
        'tpl' => '@FILE:chunks/product/product.row.tpl'
    ));
    $collectionTypeItems .= $pdo->getChunk($tpl,array(
      'typeName' => $kafel['kafelType'],
      'products' => $products
    ));
}
$output = $pdo->getChunk($tplOuter,array(
   'output' => $collectionTypeItems 
));
return $output;