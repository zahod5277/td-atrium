<?php
// 7 - шаблон товара
// 3- коллекция
$pdo = $modx->getService('pdoTools');
$query = $modx->newQuery('modResource');
$query->where(array(
   'parent' => $id,
   'template:!=' => 7,
));
$query->select('modResource.pagetitle,modResource.id,modResource.template,modResource.uri,TV.tmplvarid,TV.value');
$modx->setPlaceholder($totalVar, $modx->getCount('modResource', $query));
$query->limit($limit, $offset);
$query->leftJoin('modTemplateVarResource', 'TV', 'modResource.id=TV.contentid');
$query->prepare();
$query->stmt->execute();
$pages = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
$tpl = '@FILE:chunks/collection/category.tpl';
foreach($pages as $page){
    $coll_id = $page['id'];
    $coll_uri = $page['uri'];
    $coll_template = $page['template'];
    $coll_pagetitle = $page['pagetitle'];
    $coll_ico = $page['value'];
    if ($coll_ico ==''){
        $coll_ico = 'assets/templates/img/no_image-250x180.jpg';
    }
    if ($coll_template == 3){
    $q = $modx->newQuery('msProductData', array('id:>' => 0));
    $q->leftJoin('msProduct', 'Product', 'Product.id = msProductData.id');
    $q->sortby('msProductData.price','ASC');
    $q->limit(1);
    $q->where(array('Product.parent' => $coll_id));
    $q->prepare();
    $q->stmt->execute();
    //return $q->toSQL();
    $res = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
    $format = $res[0]['msProductData_length'].' x '.$res[0]['msProductData_width'];
    $country = $res[0]['msProductData_made_in'];
    $placeholders = array(
            'format' => $format,
            'pagetitle' => $coll_pagetitle,
            'ico' => $coll_ico,
            'country' => $country,
            'uri' => $coll_uri,
        );
} else {
      $placeholders = array(
            'pagetitle' => $coll_pagetitle,
            'ico' => $coll_ico,
            'uri' => $coll_uri 
            );
    }
    $output .= $pdo->getChunk($tpl,$placeholders);
}
return $output;