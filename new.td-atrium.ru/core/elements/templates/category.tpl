{extends 'file:templates/base.tpl'}
{block 'content'}
<div id="bg" class="other-page">
    {include 'file:chunks/product/categoryContent.tpl'}
</div>
{/block}
{block 'scripts'}
{include 'file:chunks/common/scripts.tpl'}
{include 'file:chunks/forms/callMeModal.tpl'}
{include 'file:chunks/forms/chiperModal.tpl'}
{/block}