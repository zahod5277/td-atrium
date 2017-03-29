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
    $q->select('msProductData.price as price,Product.pagetitle,TV.tmplvarid,TV.value');
    $q->leftJoin('msProduct', 'Product', 'Product.id = msProductData.id');
    $q->leftJoin('modTemplateVarResource', 'TV', 'msProductData.id=TV.contentid');
    $q->sortby('msProductData.price','ASC');
    $q->limit(4,0);
    $q->where(array('Product.parent' => $coll_id,'TV.tmplvarid:IN' =>  array(6,10,3) ));
    $q->prepare();
    $q->stmt->execute();
    $res = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
    $price = $res[0]['price'];
    $manufacturer_name = $res[0]['value'];
    $format = $res[1]['value'];
    $country = $res[2]['value'];
    $placeholders = array('min_price' => $price,
            'pagetitle' => $coll_pagetitle,
            'ico' => $coll_ico,
            'manufacturer_name' => $manufacturer_name,
            'country' => $country,
            'format' => $format,
            'uri' => $coll_uri,
        );
} else {
      $placeholders = array('min_price' => $price,
            'pagetitle' => $coll_pagetitle,
            'ico' => $coll_ico,
            'uri' => $coll_uri 
            );
    }
    $output .= $pdo->getChunk($tpl,$placeholders);
}
return $output;