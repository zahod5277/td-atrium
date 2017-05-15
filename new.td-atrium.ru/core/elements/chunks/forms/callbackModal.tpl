<form action="" class="ajax_form" method="POST">
    <div class="form-group">
        <input class="form-control" type="text" name="callbackName" placeholder="Номер телефона">
        <input type="hidden" name="callback_url" value="{$_modx->resource.pagetitle}">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-warning">Перезвоните мне!</button>
    </div>
    <h6>Ваши персональные данные не будут переданы третьим лицам.
        <a href="{'1751'|url}">
            Подробнее о политике конфиденциальности
        </a>
    </h6>
</form>