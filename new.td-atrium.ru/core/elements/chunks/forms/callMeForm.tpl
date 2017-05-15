<form action="" class="ajax_form" id="call-me-form" method="post" role="form">
    <div class="col-xs-12 col-md-6 col-md-offset-3">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Ваше имя" name="name">
            <input type="hidden" name="product" value="">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Номер телефона" name="phone">
            <input type="hidden" name="url" value="{$_modx->resource.pagetitle} id: {$_modx->resource.id}">
        </div>
        <div class="form-group centered">
            <button type="submit" class="btn btn-centered btn-warning">Перезвоните мне</button>
        </div>
    </div>
</form>