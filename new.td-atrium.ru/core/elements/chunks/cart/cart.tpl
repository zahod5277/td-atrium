<div id="msCart">
    <table class="table table-striped">
        <tr class="header">
            <th class="image span2 col-md-2">&nbsp;</th>
            <th class="title span4 col-md-4">{$_modx->lexicon('ms2_cart_title')}</th>
            <th class="count span2 col-md-2">{$_modx->lexicon('ms2_cart_count')}</th>
            <th class="price span1 col-md-1">{$_modx->lexicon('ms2_cart_price')}</th>
            <th class="remove span2 col-md-2">{$_modx->lexicon('ms2_cart_remove')}</th>
        </tr>
        {foreach $products as $product}
            <tr id="{$product.key}">
                <td class="image">
                    {if $product.thumb?}
                        <img src="{$product.thumb}" alt="{$product.pagetitle}" title="{$product.pagetitle}"/>
                    {else}
                        <img src="{'assets_url' | option}components/minishop2/img/web/ms2_small.png"
                             srcset="{'assets_url' | option}components/minishop2/img/web/ms2_small@2x.png 2x"
                             alt="{$product.pagetitle}" title="{$product.pagetitle}"/>
                    {/if}
                </td>
                <td class="title">
                    {if $product.id?}
                        <a href="{$product.id | url}">{$product.pagetitle}</a>
                    {else}
                        {$product.name}
                    {/if}
                    {if $product.options?}
                        <div class="small">
                            {if $product.options['m2price']}
                                {$product.options['m2price']} м<sup>2</sup>
                            {/if}
                        </div>
                    {/if}
                </td>
                <td class="count">
                    <form method="post" class="ms2_form form-inline" role="form">
                        <input type="hidden" name="key" value="{$product.key}"/>
                        <div class="form-group">
                            <input type="number" name="count" value="{$product.count}"
                                   class="input-sm form-control"/>
                            <span class="hidden-xs">
                                {if $product.options['m2price']}
                                     м<sup>2</sup>
                                    {else}
                                    {'ms2_frontend_count_unit' | lexicon}
                                    {/if}
                            </span>
                            <button class="btn btn-default" type="submit" name="ms2_action" value="cart/change">
                                <i class="glyphicon glyphicon-refresh"></i>
                            </button>
                        </div>
                    </form>
                </td>
                <td class="price">
                    <span>{$product.price}</span> {'ms2_frontend_currency' | lexicon}
                    {if $product.old_price?}
                        <span class="old_price">{$product.old_price} {'ms2_frontend_currency' | lexicon}
                        {/if}
                </td>
                <td class="remove">
                    <form method="post" class="ms2_form">
                        <input type="hidden" name="key" value="{$product.key}">
                        <button class="btn btn-default" type="submit" name="ms2_action" value="cart/remove">
                            <i class="glyphicon glyphicon-remove"></i>
                        </button>
                    </form>
                </td>
            </tr>
        {/foreach}
        <tr class="footer">
            <th class="total" colspan="2">{'ms2_cart_total' | lexicon}:</th>
            <th class="total_count">
                <span class="ms2_total_count">{$total.count}</span>
                {'ms2_frontend_count_unit' | lexicon}
            </th>
            <th class="total_cost">
                <span class="ms2_total_cost">{$total.cost}</span>
                {'ms2_frontend_currency' | lexicon}
            </th>
            <th>&nbsp;</th>
        </tr>
    </table>
    <div class="col-xs-12 col-md-3 cart-btn-outer">
        <a href="{$_modx->makeUrl(1)}" title="Продолжить покупки" class="cart-btn"><i class="fa fa-reply"></i>Продолжить покупки</a>
    </div>
    <div class="col-xs-12 col-md-3 col-md-offset-2 cart-btn-outer">
        <form method="post">
            <button class="cart-btn" type="submit" name="ms2_action" value="cart/clean" title="{$_modx->lexicon('ms2_cart_clean')}"><i class="glyphicon glyphicon-remove"></i> {$_modx->lexicon('ms2_cart_clean')}</button>
        </form>
    </div>
    <div class="col-xs-12 col-md-3 col-md-offset-1 cart-btn-outer">
        <a href="{$_modx->makeUrl(4892)}" title="Оформить заказ" class="cart-btn"><i class="fa fa-check"></i>Оформить заказ</a>
    </div>
</div>