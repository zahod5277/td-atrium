<?php
if (!$currencyrate = $modx->getService('currencyrate', 'currencyrate', $modx->getOption('currencyrate_core_path', null, $modx->getOption('core_path') . 'components/currencyrate/') . 'model/currencyrate/', $scriptProperties)) {
	return 'Could not load currencyrate class!';
}
if(empty($input)){return '';}
$list = $currencyrate->getList();
$input = (trim(str_replace(' ','',$input)));
if(!empty($divider)) {
	$divider = $list[$divider];
	$output = $currencyrate->formatPrice(($input / $divider), $format, $noZeros);
}
if(!empty($multiplier)) {
        $multiplier = $list[$multiplier];
        $output = $currencyrate->formatPrice(($input * $multiplier), $format, $noZeros);
}
return $output;
