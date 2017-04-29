<div id="msMiniCart" class="col-xs-12 no-padding">
    <div class="mini-cart{$total_count > 0 ? ' full' : ''}">
        <span class="cartTitle">Моя корзина</span>
        <strong class="ms2_total_count">{$total_count}</strong>
        <a class="heading" href="{$_modx->makeUrl(12)}" title="В корзину">
            <i class="fa fa-shopping-cart"></i>
        </a>
    </div>
</div>