<div class="container">
    <div class="container" id="mse2_mfilter">
        <div class="col-xs-12 col-md-12" id="textContent">
            <div class="category-details">
                {$_modx->runSnippet('!pdoCrumbs', [ 'showHome' => 1, ])}
                <h1>{$_modx->resource.pagetitle}</h1>
                <div class="col-xs-12">
                    {$_modx->resource.content}
                </div>
            </div>
        </div>
    </div>
</div>