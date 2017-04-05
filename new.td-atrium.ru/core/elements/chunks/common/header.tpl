<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2 col-sm-offset-0 col-sm-2 col-md-2 col-lg-2 centered" id="logo">
                {if $_modx->resource.id == 1}
                    <img src="{$_modx->config.assets_url}templates/img/logo.jpg" alt="ТД «Атриум»">
                {else}
                    <a href="{$_modx->makeUrl(1)}" title="На главную">
                        <img src="{$_modx->config.assets_url}templates/img/logo.jpg" alt="ТД «Атриум»">
                    </a>
                    {/if}
                <p>Интернет-магазин отделочных материалов</p>
            </div>
            <div class="col-sm-3 col-md-2 col-lg-3 hidden-xs" id="header_phone">
                <p class="header-p">КОНТАКТНЫЙ ЦЕНТР <span>(консультации)</span></p>
                <a class="header-a" href="tel:{$_modx->config.phone}">{$_modx->config.phone}</a>
                <p class="header-p">Ежедневно с 9:00 до 21:00</p>
            </div>
            <div class="col-md-2 col-lg-3 hidden-xs hidden-sm" id="header_phone2">
                <p class="header-p">ВЫСТАВОЧНЫЙ ЗАЛ</p>
                <a class="header-a" href="tel:{$_modx->config.phoneShowroom}">{$_modx->config.phoneShowroom}</a>
                <p class="header-p">Пн-Сб с 10:00 до 20:00</p>
            </div>
            <div class="col-xs-7 col-xs-offset-3 col-sm-offset-0 col-md-offset-0 col-sm-3 col-md-3 col-lg-2 b1c-good" id="header_contact">
                <button class="button" data-toggle="modal" data-target="#callbackModal">
                    <i class="fa fa-phone"></i> Обратный звонок
                </button>
                <a href="mailto:{$_modx->siteMail}"><i class="fa fa-envelope-o"></i>{$_modx->config.siteMail}</a>
                <a href="{'1754'|url}" title="г. Санкт-Петербург, ул. Железноводская, д. 12">
                    <i class="fa fa-map-marker"></i> Контакты
                </a>
            </div>
            <div class="col-xs-8 col-xs-offset-2 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 col-sm-3 col-md-3 col-lg-2" id="account">
{*                <div class="col-xs-9 col-md-9">
                    <a href="#eee" class="menu_head"></a>
                    <a href="#eee" class="menu_name">Мой аккаунт</a>
                </div>*}
                <div class="col-xs-12">
                    <div class="mini-cart">
                        <span class="cartTitle">Корзина</span>
                        <a class="heading" href="{$_modx->makeUrl(12)}" title="В корзину"></a>
                    </div>
                </div>
                <div class="col-xs-12 col-md-12" id="searchForm">
                    {$_modx->runSnippet('!mSearchForm',[
                        'tplForm' => '@FILE:chunks/filter/searchForm.tpl',
                        'element' => 'msProducts',
                        'pageId' => '13'
                        'limit' => 10
                    ])}
                </div>
            </div>
        </div>
    </div>
</header>