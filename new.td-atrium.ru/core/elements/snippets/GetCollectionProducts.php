<?php
$pdo = $modx->getService('pdoTools');
$tplOuter = '@FILE:chunks/collection/collectionOuter.tpl';
$tplType = '@FILE:chunks/collection/typeTpl.tpl';
$tpl = '@FILE:chunks/collection/collectionProduct.tpl';
$query = $modx->newQuery('modTemplateVarResource');
$query->select('modTemplateVarResource.value');
$query->leftJoin('modResource', 'modResource', 'modResource.id = modTemplateVarResource.contentid');
$query->where(array(
   'modResource.parent' => $collectionId,
   'modTemplateVarResource.tmplvarid' => 13
));
$query->distinct();
$query->prepare();
$query->stmt->execute();
$tvs = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($tvs as $tv){
    $products = $pdo->runSnippet('msProducts',array(
        'parents' => $collectionId,
        'includeTVs' => 'kafelType,inM2',
        'processTVs' => 1,
        'prepareTVs' => 1,
        'where' => '{"kafelType:=":"'.$tv['value'].'"}',
        'tpl' => '@FILE:chunks/product/product.row.tpl'
    ));
    $collectionTypeItems .= $pdo->getChunk($tpl,array(
       'typeName' => $tv['value'],
       'products' => $products
    ));
}
$output = $pdo->getChunk($tplOuter,array(
   'output' => $collectionTypeItems 
));
return $output;