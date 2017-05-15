<div class="container">
    <nav id="main-nav" data-spy="affix" data-offset-top="190" class="affix-top hidden-xs hidden-sm col-md-12">
        <ul class="top-level-1">
            {$_modx->runSnippet('pdoMenu', [
                'parents' => '0,2',
                'resources' => '-1,-9,-10,-11',
                'level' => 2,
                'sortBy' => 'menuindex',
                'sortDir' => 'desc',
                'tplInner' => '@INLINE <ul class="top-level-2">{$wrapper}</ul>',
                'tplInnerRow' => '@INLINE <li><a href="{$uri}" title="{$pagetitle}">{$menutitle}</a></li>'
                'tplOuter' => '@INLINE {$wrapper}'
            ])}
            {$_modx->runSnippet('pdoMenu', [
                'parents' => 0 
                'resources' => '9,10,11,1754',
                'showHidden' => 1,
                'level' => 2,
                'sortBy' => 'menuindex',
                'sortDir' => 'desc',
                'tplInner' => '@INLINE <ul class="top-level-2">{$wrapper}</ul>',
                'tplInnerRow' => '@INLINE <li><a href="{$uri}" title="{$pagetitle}">{$menutitle}</a></li>'
                'tplOuter' => '@INLINE {$wrapper}'
            ])}
        </ul>
    </nav>
</div>