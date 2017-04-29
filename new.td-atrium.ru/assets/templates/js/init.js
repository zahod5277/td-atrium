jQuery(document).ready(function () {
    $('.collapse-menu').on('click', function () {
        $(this).toggleClass('glyphicon-minus');
        $(this).toggleClass('active-icon');
        $(this).siblings('.level-1-link').toggleClass('active-link');
        $(this).siblings('.level-2').toggle("fast");
    });
    $(".mfilter-param input").on('change', function () {
        $("#categories-list").hide();
    });
    $('input[data-unit="PCE"]').on('change',function(){
        var inM2 = $(this).parents('form').find('.almost-equal').data('in'),
        prCount = $(this).parents('form').find('input[data-unit="PCE"]').val();
        console.log(inM2 + '--' + prCount);
        summaryM2 = Math.round(((prCount/inM2)*100))/100;
        $(this).parents('form').find('.almost-equal i').html(summaryM2);
    });
    $('body').on('click', 'i', function(){
        
    });
    $('.quantity-operator').on('click', function(){
        var input = $(this).parents('.form-group').find('input[name="count"]'),
            min = 1,
            val = parseInt($(input).val()),
            max = parseInt($(input).data('max'));
       if ($(this).data('operator')==='minus'){
           if (val > min){
            $(input).val(val-1);
            $('input[data-unit="PCE"]').trigger('change');
           }
       } else {
           if (val < max){
            $(input).val(val+1);
            $('input[data-unit="PCE"]').trigger('change');
           }
       }
    });
    $('.one-click-buy').click(function () {
        var product = $(this).data('product');
        $('#call-me-form input[name="product"]').val(product);
    });
    $('.countInput').on('change', function () {
        var val = $('input[name="totalprice"]').val() * $(this).val();
        console.log($('input[name="totalprice"]').val() + '|' + $(this).val());
        $('#product_total span').html(val);
    });
    //быстрый просмотр товара
    $('body').on('click', '.ajax_link', function () {
        var action = 'quickview';
        var id = $(this).data('action');
        $.post('ajax.php', {action: action, id: id}, function (data) {
            $('#product-modal').modal('show');
            $('#result').html(data);
        })
        return false;
    });
    $('.filter_title').click(function () {
        $(this).siblings('.filter-outer').animate({"height": "toggle"}, 600);
        $(this).find('.arrow').toggleClass('opened');
    });
    $(document).on('mse2_load', function (e, response) {
        var ahref = document.location.href;
        if (ahref.indexOf('?') != -1) {
            $('#categories-list').hide();
        } else {
            $('#categories-list').show();
        }
    });
});