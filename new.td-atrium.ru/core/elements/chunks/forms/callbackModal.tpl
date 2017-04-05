<div id="callbackModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Заказать обратный звонок</h4>
            </div>
            <div class="modal-body">
                <h4>Укажите номер вашего телефона и мы перезвоним в течении 20 минут*</h4>
                <h6>*В рабочее время. В нерабочие часы время ожидания обратного звонка может быть увеличено.</h6>
                <form action="{$_modx->resource.id|url}">
                    <div class="form-group">
                        <input class="form-control" type="text" name="callbackName" placeholder="Номер телефона">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-warning">Перезвоните мне!</button>
                    </div>
                    <h6>Ваши персональные данные не будут переданы третьим лицам.
                    <a href="{'1751'|url}">
                        Подробнее о политике конфиденциальности
                    </a>
                    </h6>
            </div>
            </form>
        </div>
    </div>
</div>
</div>