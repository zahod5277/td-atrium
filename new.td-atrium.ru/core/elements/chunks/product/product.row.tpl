{*Заполняем значения цен, исходя из единицы измерения и наличия цены в евро*}
{var $currency='fa fa-rub'}
{if $price=='0'||$price==''}
    {if $price_eu!='0'}
        {var $price = $_modx->runSnippet('@FILE:snippets/currConverter.php',[
            'input' => $price_eu,
            'multiplier' => 'EUR',
            'format' => '[0, "", ""]',
            'noZeros' => '0'
        ])}
    {/if}
{/if}
{if $unit=='м.кв.'}
    {var $price = $_modx->runSnippet('@FILE:snippets/inM2Divider.php',[
        'price' => $price,
        'inM2' => $inM2
    ])}
{/if}

<div class="col-xs-12 col-sm-6 col-md-4 ms2_product">
    
    <div class="image">
        <a href="{$id|url}">
            <img class="img img-responsive" src="{$row}"/>
        </a>
        <div class="hidden-xs col-md-12 no-padding quick-view-outer">
            <button type="button" class="ajax_link" data-toggle="modal" data-action="{$id}" data-target="#product-modal"><i class="fa fa-eye"></i> Быстрый просмотр</button>    
        </div>
    </div>
    <div class="name">
        <a href="{$id|url}">
            {$pagetitle}
        </a>
    </div>
    <div class="col-xs-12 col-md-12 no-padding price-outer">
        <div class="col-xs-12 col-md-8 no-padding">
            <p class="price-desc">Цена за шт.</p>
            <span class="price">{$price|number: 2 : '.' : ' '} <i class="{$currency}"></i></span>

        </div>
        {if $unit == 'м.кв.'}
            {if $inM2!='' || $inM2!='0'}
                {var $m2price = $price*$inM2}
                <div class="col-xs-12 col-md-4 no-padding">
                    <p class="price-desc">Цена за м<sup>2</sup></p>
                    <span class="price">{$m2price|number: 0 :'.':' '} <i class="{$currency}"></i></span>
                </div>
            {/if}
        {/if}
        <div class="instock-outer col-xs-12 no-padding">
            <div class="col-xs-12 col-md-6 no-padding">
                <p><i class="fa fa-check"></i> {$avail}</p>
            </div>
            <div class="col-xs-12 col-md-6 no-padding">
                {$_modx->runSnippet('!addComparison',[
                    'list_id' => '16',
                    'id' => $id,
                    'tpl' => '@FILE:chunks/product/comparison.tpl'
                ])}
            </div>
        </div>
        <div class="col-xs-12 col-md-6 no-padding">
            <form method="post" class="ms2_form">
                <input type="hidden" name="count" value="1" class="form-control input-sm" min="1">
                <button class="btn btn-warning" type="submit" name="ms2_action" value="cart/add"><i class="fa fa-shopping-cart"></i><span>В корзину</span></button>
                <input type="hidden" name="id" value="{$id}">
                <input type="hidden" name="options" value="[]">
            </form>
        </div>
        <div class="col-xs-12 col-md-6 no-padding">
            <button class="one-click-buy" data-toggle="modal" data-target="#call-me" data-product="{$id} - {$pagetitle}" title="купить в один клик">Купить в один клик</button>
        </div>
        <div class="col-xs-12 no-padding">
            <p class="micro-disclaimer">*Цена указана со склада в Санкт-Петербурге</p>
        </div>
    </div>
</div>