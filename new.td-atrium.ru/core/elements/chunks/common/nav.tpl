<div class="container">
    <nav id="main-nav" data-spy="affix" data-offset-top="190" class="affix-top hidden-xs hidden-sm col-md-12">
    {$_modx->runSnippet('pdoMenu', [
        'parents' => '0,2',
        'level' => 2,
        'sortBy' => 'menuindex',
        'sortDir' => 'desc',
        'tplInner' => '@INLINE <ul class="top-level-2">{$wrapper}</ul>',
        'tplInnerRow' => '@INLINE <li><a href="{$uri}" title="{$pagetitle}">{$pagetitle}</a></li>'
        'tplOuter' => '@INLINE <ul class="top-level-1">{$wrapper}</ul>'
    ])}
        
    </nav>
</div>