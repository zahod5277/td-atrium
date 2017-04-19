<?php

if (!empty($scriptProperties['vendor'])) {
 $vendor = $modx->getObject('msVendor', $scriptProperties['vendor']);
 $name = $vendor->get('name');
} else {
    $name = 'Не могу определить имя производителя';
}

return $name;