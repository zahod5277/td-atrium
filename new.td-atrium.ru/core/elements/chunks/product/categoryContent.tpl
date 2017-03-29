<div class="container">
     {$_modx->runSnippet('!mFilter2',[
        'parents' => $_modx->resource.id,
        'element' => 'msProducts',
        'suggestions' => 0,
        'tplOuter' => '@FILE:chunks/filter/filterOuter.tpl',
        'paginator' => 'pdoPage@myParams?&pageLimit=`2`',
        'limit' => '21',
        'filters' => 'ms|price:number,ms|collection,ms|format,ms|kafelType,ms|made_in,ms|vendor:vendors,ms|primenenie,ms|surface',
        'tplFilter.outer.default' => '@FILE:chunks/filter/mFilter2.filter.outer.tpl',
        'tplFilter.row.default' => '@FILE:chunks/filter/mFilter2.filter.checkbox.tpl',
        'tplFilter.row.ms|price' => '@FILE:chunks/filter/mFilter2.filter.number.tpl',
        'tplFilter.outer.ms|price' => '@FILE:chunks/filter/mFilter2.filter.slider.tpl',
        'tpl' => '@FILE:chunks/product/product.row.tpl',
        'includeTVs' => 'inM2'
        ])}
</div>