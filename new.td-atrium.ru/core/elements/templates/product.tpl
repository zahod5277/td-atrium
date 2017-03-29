{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="bg" class="other-page">
    <div class="container">
        <div class="col-xs-12 category-details">
            {include 'file:chunks/product/msProduct.content.tpl'}
        </div>
    </div>
</div>
{/block}
{block 'scripts'}
{include 'file:chunks/common/scripts.tpl'}
{include 'file:chunks/forms/callMeModal.tpl'}
{include 'file:chunks/forms/chiperModal.tpl'}
{/block}