{extends 'file:templates/base.tpl'}
    {block 'content'}
        <div id="bg">
            {include 'file:chunks/main/topBlock.tpl'}
            {include 'file:chunks/main/mainContent.tpl'}
            {include 'file:chunks/main/adv.tpl'}
            <div class="container">
                <div class="category-details">
                    {$_modx->resource.content}
                </div>
            </div>
        </div>
    {/block}
    {block 'scripts'}
        {include 'file:chunks/common/scripts.tpl'}
        {ignore}
        <script>
            jQuery('.bxslider').bxSlider({
                'pager': true,
                'controls': false,
                'auto': true,
                'adaptiveHeight': true
            });
        </script>
        {/ignore}
    {/block}
    </body>
</html>