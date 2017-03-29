<!doctype html>
<html>
    {block 'head'}
        {include 'file:chunks/common/head.tpl'}
    {/block}
    <body>
        {block 'header'}
        {include 'file:chunks/common/header.tpl'}
        {include 'file:chunks/common/nav.tpl'}
        {/block}
        {block 'content'}
        <div id="bg">
            <div class="container">
                <div class="category-details">
                    {$_modx->resource.content}
                </div>
            </div>
        </div>
        {/block}
        {block 'footer'}
            {include 'file:chunks/common/footer.tpl'}
        {/block}
        {block 'scripts'}
        {include 'file:chunks/common/scripts.tpl'}
        {/block}
    </body>
</html>