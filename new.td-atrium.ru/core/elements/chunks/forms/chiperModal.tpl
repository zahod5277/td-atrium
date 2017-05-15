<!-- Modal -->
<div id="chiper" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Нашли дешевле?</h4>
      </div>
      <div class="modal-body">
          {$_modx->runSnippet('!AjaxForm', [
            'form' => '@FILE:chunks/forms/chiperForm.tpl',
            'hooks' => 'spam,email',
            'emailTpl' => 'chiper-callback-tpl',
            'emailSubject' => 'Нашли дешевле',
            'emailTo' => $_modx->config.siteMail,
            'emailFrom' => $_modx->config.emailFrom,
            'validate' => 'ch_name:required,ch_phone:required',
            'validationErrorMessage' =>'В форме содержатся ошибки!',
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