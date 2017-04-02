{if $total!='0'}
<div class="comments">
    <h3 class="title">{'comments'|lexicon} (<span id="comment-total">{$total}</span>)</h3>

    <div id="comments-wrapper">
        <ol class="comment-list" id="comments">{$comments}</ol>
    </div>

    <div id="comments-tpanel">
        <div id="tpanel-refresh"></div>
        <div id="tpanel-new"></div>
    </div>
</div>
{else}
    <div class="col-xs-12">
        <h3>К этому товару еще никто не оставил отзыва. Будьте первым!</h3>
    </div>
{/if}
<!--tickets_subscribed checked-->
