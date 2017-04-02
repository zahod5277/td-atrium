<div class="container" id="mse2_mfilter">
    <div class="col-xs-12 col-md-2" id="sidebar">
        <div id="cat-list">
            <div class="box-heading">
                <h3><i class="fa fa-bars"></i> Отбор по параметрам</h3>
            </div>
            <div class="box-category">
                <form action="" method="post" id="mse2_filters">
                    {$filters}
                    <br/> 
                    {if $filters !=''}
                        <button type="reset" class="btn btn-default">{$_modx->lexicon('mse2_reset')}</button>
                        <button type="submit" class="btn btn-success pull-right hidden">{$_modx->lexicon('mse2_submit')}</button>
                        <div class="clearfix"></div>
                    {/if}
                </form>

                <br/>
                <br/>
                <div>{$_modx->lexicon('mse2_limit')}
                    <select name="mse_limit" id="mse2_limit">
                        <option value="10" {$limit == '10'? 'selected': ''}>10</option>
                        <option value="25" {$limit == '25'? 'selected': ''}>25</option>
                        <option value="50" {$limit == '50'? 'selected': ''}>50</option>
                        <option value="100" {$limit == '100'? 'selected': ''}>100</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-10" id="content">
        <div class="category-details">
            {include 'file:chunks/common/crumbs.tpl'}
            <h1>{$_modx->resource.pagetitle}</h1>
            <div id="categories-list" class="col-xs-12 col-md-12">

                {$_modx->runSnippet('!pdoPage',
                    [
                    'element' => '@FILE:snippets/getCollections.php',
                    'id' => $_modx->resource.id,
                    'limit' => 15,
                    'pageLinkScheme' => '/{$pageVarKey}-{$page}',
                    'pageNavVar' => 'pagenav'
                    ]
                    )}
                {$_modx->getPlaceholder('pagenav')}
            </div>
        </div>
        <div class="category-details">
            <div id="mse2_sort" class="span5 col-md-5">
                {$_modx->lexicon('mse2_sort')}
                <a href="#" data-sort="resource|publishedon" data-dir="{$mse2_sort =='resource|publishedon:desc'?'desc':''}" data-default="desc" class="sort">{$_modx->lexicon('mse2_sort_publishedon')} <span></span></a>
            </div>

            <div class="span9" id="mItems">
                {if $tpls !=''}
                    <div id="mse2_tpl" class="span4 col-md-4">
                        <a href="#" data-tpl="0" class="{$tpl0}">{$_modx->lexicon('mse2_chunk_default')}</a> /
                        <a href="#" data-tpl="1" class="{$tpl1}">{$_modx->lexicon('mse2_chunk_alternate')}</a>
                    </div>
                {/if}
                <div id="mse2_selected_wrapper">
                    <div id="mse2_selected">{$_modx->lexicon('mse2_selected')}:
                        <span></span>
                    </div>
                </div>

                <div id="mse2_results">
                    {$results}
                </div>

                <div class="mse2_pagination">
                    {$_modx->getPlaceholder('page.nav')}
                </div>
            </div>
        </div>
    </div>
</div>