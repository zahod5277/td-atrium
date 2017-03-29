<div class="container">
    <div class="container" id="mse2_mfilter">
        <div class="col-xs-12 col-md-2" id="sidebar">
            <div id="cat-list">
                <div class="box-heading">
                    <h3><i class="fa fa-bars"></i> Отбор по параметрам</h3>
                </div>
                <div class="box-category">
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-10" id="content">
            <div class="category-details">
                {$_modx->runSnippet('!pdoCrumbs', [ 'showHome' => 1, ])}
                <h1>{$_modx->resource.pagetitle}</h1>
                {$_modx->resource.content}
            </div>
        </div>
    </div>
</div>