<div id="tabs" class="col-xs-12 no-padding">
    <ul class="nav nav-tabs">
        <li><a data-toggle="tab" href="#home">Описание</a></li>
        <li class="active"><a data-toggle="tab" href="#menu1">Характеристики</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade">
            {if $_modx->resource.content?}
                {$_modx->resource.content}
                {else}
                <p>Описание временно отсутствует. Для уточнения информации по данной позиции вы можете связаться с нашими менеджерами по телефону +7 (812) 45-45-044 ежедневно с 9:00 до 21:00. Мы с радостью ответим на Ваши вопросы!</p>
            {/if}
        </div>
        <div id="menu1" class="tab-pane fade in active">
            <div class="table-responsive">
                <table class="table table-stripped">
                    {if $kafelType?}
                    <tr>
                        <td>Тип плитки</td>
                        <td>{$kafelType}</td>
                    </tr>
                    {/if}
                    {if $primenenie?}
                    <tr>
                        <td>Применение</td>
                        <td>{$primenenie}</td>
                    </tr>
                    {/if}
                    {if $surface?}
                    <tr>
                        <td>Поверхность</td>
                        <td>{$surface}</td>
                    </tr>
                    {/if}
                    {if $color?}
                    <tr>
                        <td>Цвет</td>
                        <td>{$color}</td>
                    </tr>
                    {/if}
                    {if $made_in?}
                    <tr>
                        <td>Страна-производитель</td>
                        <td>{$made_in}</td>
                    </tr>
                    {/if}
                    {if $vendor?}
                    {var $vendorName = $_modx->runSnippet('@FILE:snippets/getVendor.php',['vendor' => $vendor])}
                    <tr>
                        <td>Производитель</td>
                        <td>{$vendorName}</td>
                    </tr>
                    {/if}
                    {if $inM2?}
                    <tr>
                        <td>Шт. в м<sup>2</sup></td>
                        <td>{$inM2}</td>
                    </tr>
                    {/if}
                    {if $length?}
                    <tr>
                        <td>Длина одной плитки</td>
                        <td>{$length}</td>
                    </tr>
                    {/if}
                    {if $width?}
                    <tr>
                        <td>Ширина одной плитки</td>
                        <td>{$width}</td>
                    </tr>
                    {/if}
                    {if $weight?}
                    <tr>
                        <td>Вес одной плитки</td>
                        <td>{$weight}</td>
                    </tr>
                    {/if}
                    {if $box?}
                    <tr>
                        <td>В упаковке</td>
                        <td>{$box}</td>
                    </tr>
                    {/if}
                </table>
            </div>
        </div>
    </div>
</div>