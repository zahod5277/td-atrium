<footer>
    <div class="container">
        <div class="column col-xs-12 col-md-3">
            <h6>Связаться с нами</h6>
            <ul>
                <li>
                    <a href="mailto:{$_modx->config.phone}"><i class="fa fa-phone"></i>{$_modx->config.phone}</a>
                </li>
                <li>
                    <a href="mailto:{$_modx->config.siteMail}"><i class="fa fa-envelope-o"></i> {$_modx->config.siteMail}</a>
                </li>
            </ul>
        </div>
        <div class="column col-xs-12 col-md-3">
            <h6>Заказ</h6>
            <ul>
                <li><a href="{'16'|url}" id="compare-total"><i class="fa fa-exchange"></i>Список сравнения</a></li>
                <li><a href="{'12'|url}"><i class="fa fa-shopping-cart"></i>Корзина покупок</a></li>
                <li><a href="{'1754'|url}"><i class="fa fa-map-marker"></i>Контакты</a></li>
            </ul>
        </div>
        <div class="column col-xs-12 col-md-3">
            <h6>Правила продажи</h6>
            {$_modx->runSnippet('pdoMenu',[
                'parents' => 10
            ])}
        </div>
        <div class="column col-xs-12 col-md-3">
            <h6>Информация</h6>
            <ul>
                <li><a href="{'9'|url}">Акции</a></li>
                <li><a href="{'11'|url}">О компании</a></li>
                <li><a href="{'1752'|url}">Карта сайта</a></li>
            </ul>
        </div>
    </div>
    <div class="container">
        <div id="powered">
            <p class="powered_powered">
                <!--noindex-->&copy; 2015-{''|date:'Y'}<!--/noindex--> ТД «Атриум» — керамический кирпич и клинкерная плитка, фасадные термопанели с плиткой под кирпич<br><!--noindex-->Все права защищены. Любое копирование материалов сайта возможно только с указанием активной, индексируемой ссылки на источник.<!--/noindex-->
            </p>
        </div>
    </div>
</footer>
{include 'file:chunks/product/quickViewModal.tpl'}
{include 'file:chunks/common/callback.tpl'}