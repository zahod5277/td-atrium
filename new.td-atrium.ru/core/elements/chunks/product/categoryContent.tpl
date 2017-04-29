<div class="container">
     {$_modx->runSnippet('!mFilter2',[
        'parents' => $_modx->resource.id,
        'element' => 'msProducts',
        'suggestions' => 1,
        'suggestionsMaxFilters' => 5000,
        '&suggestionsMaxFilters' => 10000,
        'tplOuter' => '@FILE:chunks/filter/filterOuter.tpl',
        'ajaxMode' => 'button',
        'limit' => '21',
        'filters' => 'ms|collection,ms|format,ms|kafelType,ms|made_in,ms|vendor:vendors,ms|primenenie,ms|surface',
        'tplFilter.outer.default' => '@FILE:chunks/filter/mFilter2.filter.outer.tpl',
        'tplFilter.row.default' => '@FILE:chunks/filter/mFilter2.filter.checkbox.tpl',
        'tpl' => '@FILE:chunks/product/product.row.tpl'
        ])}
</div>