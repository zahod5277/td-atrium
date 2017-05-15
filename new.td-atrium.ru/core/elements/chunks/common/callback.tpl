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
               {$_modx->runSnippet('!AjaxForm', [
                'form' => '@FILE:chunks/forms/callbackModal.tpl',
                'hooks' => 'spam,FormItSaveForm,email',
                'emailTpl' => 'callback-tpl',
                'emailSubject' => 'Перезвоните мне',
                'emailTo' => $_modx->config.siteMail,
                'emailFrom' => $_modx->config.emailFrom,
                'validate' => 'callbackName:required'
                'validationErrorMessage' =>'В форме содержатся ошибки!'
                'successMessage' => 'Сообщение успешно отправлено'
            ])}
        </div>
    </div>
</div>
</div>