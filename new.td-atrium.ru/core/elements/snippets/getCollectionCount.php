<?php

/* 
 * Считаем, сколько прямых потомков-товаров есть в этой категории
 * и если больше нуля, то показываем стиль "коллекцию", а не категорию с фильтром
 */

$query = $modx->newQuery('msProduct');
$query->where(array('parent' => $id,'class_key:!=' => 'msCategory'));
$query->prepare();
$count = $modx->getCount('msProduct',$query);
$parentIds = $modx->getParentIds($id);
if (($count>0)&&($parentIds>1)){
 return true;
} else {
    return false;
}
