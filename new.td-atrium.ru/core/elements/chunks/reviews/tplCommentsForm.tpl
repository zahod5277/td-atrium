<div class="col-xs-12">
    <div id="comment-form-placeholder">
        <form id="comment-form" action="{$_modx->resource.id|url}" method="post" class="well">
            <div id="comment-preview-placeholder"></div>
            <input type="hidden" name="thread" value="{$thread}"/>
            <input type="hidden" name="parent" value="0"/>
            <input type="hidden" name="id" value="0"/>
            <label for="comment-name">Ваше имя</label>
            <input type="text" name="name" value="{$name}" id="comment-name" class="form-control"/>
            <span class="error"></span>

            <label for="comment-email">E-mail:</label>
            <input type="text" name="email" value="{$email}" id="comment-email" class="form-control"/>
            <span class="error"></span>
            <label for="comment-editor"></label>
            <textarea name="text" id="comment-editor" cols="30" rows="10" class="form-control"></textarea>
            <div class="col-xs-12">
                 [[+captcha]]
            </div>
            <div class="form-actions">
                <input type="button" class="btn btn-default preview" value="{'ticket_comment_preview'|lexicon}"
                       title="Ctrl + Enter"/>
                <input type="submit" class="btn btn-primary submit" value="{'ticket_comment_save'|lexicon}"
                       title="Ctrl + Shift + Enter"/>
                <span class="time"></span>
            </div>
        </form>
    </div>

    <!--tickets_captcha
    <div class="form-group">
        <label for="comment-captcha" id="comment-captcha">[[+captcha]]</label>
        <input type="text" name="captcha" value="" id="comment-captcha" class="form-control" />
        <span class="error"></span>
    </div>
    -->
</div>