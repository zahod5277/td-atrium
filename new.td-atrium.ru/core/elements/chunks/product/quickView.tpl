<h1>{$pagetitle}</h1>
<div id="msProduct" class="row">
    <div class="span5 col-md-5">
        <img src="{$image}" alt="{$pagetitle}" class="img img-responsive">
    </div>
    <div class="span7 col-md-7">
        <form class="form-horizontal ms2_form" method="post">
            <input type="hidden" name="id" value="{$id}" />
            <div class="form-group">  
                <div class="col-xs-12">
                    <label class="price-main">
                        {$price} {$_modx->lexicon('ms2_frontend_currency')};
                    </label>
                </div>
            </div>
            <div class="col-sm-offset-1">
                <div class="col-sm-3 no-padding w1">В корзину</div>
                <div class="col-sm-3 w2"></div>
                <div class="col-sm-3">
                    <button id="in-cart" type="submit" name="ms2_action" value="cart/add"></button>
                </div>
            </div>
            <div class="form-group col-xs-12 form-inline">
                <label class="col-sm-12 control-label" for="product_price">{$_modx->lexicon('ms2_cart_count')}:</label>
                <div class="col-sm-offset-5 col-sm-3">
                    <span class="quantity-operator plus">+</span>
                    <input type="text" name="count" id="product_price" class="input-sm form-control" value="1" />
                    <span class="quantity-operator minus">-</span>
                    {$_modx->lexicon('ms2_frontend_count_unit')}
                </div>
            </div>
            <div class="col-xs-12 col-md-12" id="cheaper-btns">
                <div class="form-group">
                    <button type="button" class="modal-btn btn btn-warning" data-product="{$pagetitle}" data-toggle="modal" data-target="#call-me"><i class="fa fa-phone padding-right"></i>ПОЗВОНИТЕ МНЕ, я хочу это купить!</button>
                </div>
                <div class="form-group">
                    <button type="button" class="modal-btn btn btn-warning" data-product="{$pagetitle}" data-toggle="modal" data-target="#chiper">Нашли дешевле?</button>
                </div>
            </div>
            <div id="tabs">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#home">Описание</a></li>
                    <li><a  data-toggle="tab" href="#menu1">Характеристики</a></li>
                    <li><a data-toggle="tab" href="#menu2">Отзывы</a></li>
                </ul>
                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <p></p>
                    </div>
                    <div id="menu1" class="tab-pane fade">
                        <div class="table-responsive">
                            <table class="table table-stripped">
                                {if $collection!=''}
                                    <tr><td>Коллекция:</td>
                                        <td> {$collection}</td></tr>
                                    {/if}
                                    {if $category!=''}
                                    <tr><td>Категория:</td>
                                        <td> {$category}</td></tr>
                                    {/if}
                                    {if $primenenie!=''}
                                    <tr><td>Применение:</td>
                                        <td> {$primenenie}</td></tr>
                                    {/if}
                                    {if $_modx->resource.format!=''}
                                    <tr><td>Размер:</td>
                                        <td> {$format}</td></tr>
                                    {/if}
                                    {if $_modx->surface!=''}
                                    <tr><td>Поверхность:</td>
                                        <td> {$surface}</td></tr>
                                    {/if}
                                    {if $country!=''}
                                    <tr><td>Страна-производитель:</td>
                                        <td> {$country}</td></tr>
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
        </form>
    </div>
</div>
<script>
    $('.modal-btn').on('click', function () {
        var product = $('.modal-btn').data('product');
        $('input[name="product"]').val(product);
    });
</script>