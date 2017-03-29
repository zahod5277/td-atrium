{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="bg">
        <div class="container">
            <div class="category-details">
                <h1>Состав коллекции {$_modx->resource.pagetitle}</h1>
                {$_modx->runSnippet('@FILE:snippets/GetCollectionProducts.php',[
                    'collectionId' => $_modx->resource.id
                ])}
            </div>
        </div>
    </div>
{/block}