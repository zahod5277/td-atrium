<?php
if ($id != ''){
    $vendor = $modx->getObject('msVendor',$id);
    $output = $vendor->get('name');
    return $output;
} else {
    return;
}

