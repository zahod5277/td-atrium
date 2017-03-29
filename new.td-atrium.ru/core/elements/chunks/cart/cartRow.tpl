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
<tr id="{$key}">
    <td class="image"><img src="[[+thumb:default=`[[++assets_url]]components/minishop2/img/web/ms2_small.png`]]" /></td>
    <td class="title"><a href="{$_modx->makeUrl($id)}">{$pagetitle}</a><br/>
        <small><i>{$_pls['option.color']} {$_pls['option.size']} 
                {if $_pls['option.m2price'] != ''}
                    {$_pls['option.m2price']} м<sup>2</sup>
                {/if}
            </i></small>
    </td>
    <td class="count">
        <form method="post" class="ms2_form form-inline" role="form">
            <input type="hidden" name="key" value="{$key}" />
            <div class="form-group">
                <input type="number" name="count" value="{$count}" max-legth="4" class="input-sm form-control" />
                {if $_pls['option.m2price']!=''}
                    м<sup>2</sup>
                {else}
                    шт.
                {/if}
                <button class="btn btn-default" type="submit" name="ms2_action" value="cart/change"><i class="glyphicon glyphicon-refresh"></i></button>
            </div>
        </form>
    </td>
    <td class="price">
        <span>
            {if $_pls['option.m2price']!=''}
                {var $price = $price *$inM2}
            {/if}
            {$price} <i class="fa fa-rub"></i>
        </span>
    </td>
    <td class="remove">
        <form method="post" class="ms2_form">
            <input type="hidden" name="key" value="{$key}">
            <button class="btn btn-default" type="submit" name="ms2_action" value="cart/remove" title="{$_modx->lexicon('ms2_cart_remove')}"><i class="glyphicon glyphicon-remove"></i></button>
        </form>
    </td>
</tr>
<!--minishop2_option.color {$_modx->lexicon('ms2_frontend_color')}: {$_pls['option.color']};-->
<!--minishop2_option.size {$_modx->lexicon('ms2_frontend_size')}: {$_pls['option.size']};-->
<!--minishop2_old_price <br/><span class="old_price">{$old_price} {$_modx->lexicon('ms2_frontend_currency')}</span>-->