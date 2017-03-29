{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="bg" class="other-page container">
        <div class="col-xs-12">
            {$_modx->resource.content}
        </div>
    </div>
{/block}