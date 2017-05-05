{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="bg" class="other-page">
        {var $isCollection = $_modx->runSnippet('@FILE:snippets/getCollectionCount.php',[
            'id' => $_modx->resource.id
        ])}
        {if $isCollection}
            {include 'file:chunks/collection/collectionTemplateOuter.tpl'}
        {else}
            {include 'file:chunks/product/categoryContent.tpl'}
        {/if}
    </div>
{/block}