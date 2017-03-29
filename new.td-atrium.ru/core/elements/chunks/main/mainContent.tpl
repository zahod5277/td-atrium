<div class="container">
    <div class="col-xs-12 col-md-2" id="sidebar">
    <div id="cat-list">
        <div class="box-heading">
            <h3><i class="glyphicon glyphicon-menu-hamburger"></i> Категории</h3>
        </div>
        <div class="box-category">
        {$_modx->runSnippet('pdoMenu', [
        'parents' => 2,
        'level' => 2,
        'tplOuter' => '@INLINE <ul class="level-1">{$wrapper}</ul>',
        'tpl' => '@INLINE <li><a class="level-1-link" title="{$pagetitle}" href="{$uri}">{$pagetitle}</a> <i class="collapse-menu glyphicon glyphicon-plus"></i>{$wrapper}',
        'tplInner' => '@INLINE <ul class="level-2">{$wrapper}</ul>',
        'tplInnerRow' => '@INLINE <li><a title="{$pagetitle}" href="{$uri}">{$pagetitle}</a></li>'
        ])}
        </div>
    </div>
</div>

<div class="col-xs-12 col-md-10" id="content">
    <section class="hidden-xs hidden-sm" id="slider">
        <ul class="bxslider">
            {$_modx->runSnippet('BannerY', [
            'position' => 1,
            'tpl' => '@FILE:chunks/main/slideTpl.tpl'
            ]
            )}
            
        </ul>
    </section>
</div>
</div>