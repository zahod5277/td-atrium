{var $currency='fa fa-rub'}
{if $price=='0'}
    {if $price_eu!='0'}
        <strong>
            {var $price = $_modx->runSnippet('@FILE:snippets/currConverter.php',[
            'input' => $price_eu,
            'multiplier' => 'EUR',
            'format' => '[0, "", ""]',
            'noZeros' => '0'
        ])}
        </strong>
    {/if}
{/if}
{if $unit=='м.кв.'}
    {var $priceM2 = $price}
    {var $priceInPcs = $_modx->runSnippet('@FILE:snippets/inM2Divider.php',[
        'price' => $price,
        'inM2' => $inM2
    ])}
    {else}
        {var $priceM2 = $price * $inM2}
        {var $priceInPcs = $price}
{/if}
{$_modx->runSnippet('!pdoCrumbs', [ 'showHome' => 1, ])}
<h1>{$_modx->resource.pagetitle}</h1>
<div id="msProduct" class="row">
    <div class="span5 col-md-5">
        {$_modx->runSnippet('!msGallery')}
    </div>
    <div class="span7 col-md-7">
        <form class="form-horizontal ms2_form" method="post">
            <input type="hidden" name="id" value="{$_modx->resource.id}" />
            <div class="form-group">  
                <div class="col-xs-12">
                    <div class="col-xs-12 col-md-4" id="mainPrice">
                        <h3>Цена за шт:</h3>
                        <label class="price-main">
                            <span>{$priceInPcs}</span> <i class="{$currency}"></i>
                            {if $unit=='шт.'}
                                [[!+old_price:gt=`0`:then=`<span class="old_price">{$old_price} {$_modx->lexicon('ms2_frontend_currency')}</span>`:else=``]]
                            {/if}
                        </label>
                    </div>
                    {if $_modx->resource.inM2!='' || $_modx->resource.inM2!='0'}
                        <div class="col-xs-12 col-md-4" id="m2price">
                            <h3>Цена за м<sup>2</sup>:</h3>
                            <label class="price-main">
                                <span>{$priceM2}</span> <i class="{$currency}"></i>
                                {if $unit=='м.кв.'}
                                    [[!+old_price:gt=`0`:then=`<span class="old_price">{$old_price} {$_modx->lexicon('ms2_frontend_currency')}</span>`:else=``]]
                                {/if}
                            </label>
                        </div>
                    {/if}     
                    <div class="col-xs-12 col-md-4" id="totalprice">
                        <h3>Итого:</h3>
                        <p class="price-main" id="product_total"><span>{$price}</span> {$_modx->lexicon('ms2_frontend_currency')}</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-offset-3">
                <div class="col-sm-3 w1">В корзину</div>
                <div class="col-sm-3">
                    <button id="in-cart" type="submit" name="ms2_action" value="cart/add"></button>
                </div>
                <div class="col-sm-3">
                    {$_modx->runSnippet('!addComparison',[
                        'list_id' => '16',
                        'id' => $id,
                        'tpl'=>'@FILE:chunks/product/comparisonProductContent.tpl'
                    ])}
                </div>
            </div>
            <div class="form-group col-xs-12 form-inline">
                <label class="col-sm-12 control-label" for="product_price">{$_modx->lexicon('ms2_cart_count')}:</label>
                <div class="col-sm-offset-4 col-sm-5 count-outer">
                    <div class="col-xs-12 col-md-6 no-padding">
                        <input type="number" name="count" id="product_price" class="countInput input-sm form-control" value="1" min="1" />
                    </div>
                    <input type="hidden" name="options[m2price]">
                    <input type="hidden" name="totalprice" value="{$price}">
                    <div class="col-xs-12 col-md-6">
                        <strong class="msProductContentUnit">
                            {$unit}
                        </strong>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-12" id="cheaper-btns">
                <div class="form-group">
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#call-me"><i class="fa fa-phone padding-right"></i>ПОЗВОНИТЕ МНЕ, я хочу это купить!</button>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#chiper">Нашли дешевле?</button>
                </div>
            </div>
            {include 'file:chunks/product/tabs.tpl'}
        </form>
    </div>
</div>