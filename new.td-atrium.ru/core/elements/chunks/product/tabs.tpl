<div id="tabs">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Описание</a></li>
        <li><a data-toggle="tab" href="#menu1">Характеристики</a></li>
        <li><a data-toggle="tab" href="#menu2">Отзывы</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            {if $_modx->resource.content!=''}
                {$_modx->resource.content}
                {else}
                <p>Описание временно отсутствует. Для уточнения информации по данной позиции вы можете связаться с нашими менеджерами по телефону +7 (812) 45-45-044 ежедневно с 9:00 до 21:00. Мы с радостью ответим на Ваши вопросы!</p>
            {/if}
        </div>
        <div id="menu1" class="tab-pane fade">
            <div class="table-responsive">
                <table class="table table-stripped">
                    {if $_modx->resource.collection!=''}
                    <tr><td>Коллекция:</td>
                    <td> {$_modx->resource.collection}</td></tr>
                    {/if}
                    {if $_modx->resource.category!=''}
                    <tr><td>Категория:</td>
                    <td> {$_modx->resource.category}</td></tr>
                    {/if}
                    {if $_modx->resource.primenenie!=''}
                    <tr><td>Применение:</td>
                    <td> {$_modx->resource.primenenie}</td></tr>
                    {/if}
                    {if $_modx->resource.format!=''}
                    <tr><td>Размер:</td>
                    <td> {$_modx->resource.format}</td></tr>
                    {/if}
                    {if $_modx->resource.surface!=''}
                    <tr><td>Поверхность:</td>
                    <td> {$_modx->resource.surface}</td></tr>
                    {/if}
                    {if $_modx->resource.country!=''}
                    <tr><td>Страна-производитель:</td>
                    <td> {$_modx->resource.country}</td></tr>
                    {/if}
                    {if $vendor!=''}
                    <tr>
                        <td>Производитель:</td>
                        <td>{$_modx->runSnippet('@FILE:snippets/getVendorName.php',[
                                'id' => $vendor
                            ])}
                        </td>
                    </tr>
                    {/if}
                </table>
            </div>
        </div>
        <div id="menu2" class="tab-pane fade">
            <p>К данному товару еще никто не оставил отзыв. Будьте первым!</p></p>
        </div>
    </div>
</div>