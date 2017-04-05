<!-- Modal -->
<div id="call-me" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Запрос товара {$_modx->resource.pagetitle}</h4>
            </div>
            <div class="modal-body">
            {$_modx->runSnippet('!AjaxForm', [
                'form' => '@FILE:chunks/forms/callMeForm.tpl',
                'hooks' => 'email',
                'emailTpl' => 'call-me-callback-tpl',
                'emailSubject' => 'Перезвоните мне, я хочу это купить',
                'emailTo' => 'zahod5277@mail.ru',
                'emailFrom' => 'admin@td-atrium.ru',
                'validate' => 'name:required,phone:required'
                'validationErrorMessage' =>'В форме содержатся ошибки!'
                'successMessage' => 'Сообщение успешно отправлено'
            ])}
            </div>
            <div class="clearfix"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-error" data-dismiss="modal">Закрыть</button>
            </div>
        </div>

    </div>
</div>