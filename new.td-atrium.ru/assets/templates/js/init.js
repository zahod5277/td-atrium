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
        inM2Titler(this);
    });
    $('#result').on('click', 'i', function(){
        quantityChanger($(this));
    });
    $('.quantity-operator').on('click', function(){
        quantityChanger($(this));
    });
    $('body').on('change', '.countInput',function () {
        var val = $('input[name="totalprice"]').val() * $(this).val();
        $('#product_total span').html(val);
    });
    $('.one-click-buy').click(function () {
        var product = $(this).data('product');
        $('#call-me-form input[name="product"]').val(product);
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

function quantityChanger($this){
        var input = $($this).parents('.form-group').find('input[name="count"]'),
            min = 1,
            val = parseInt($(input).val()),
            max = parseInt($(input).data('max'));
       if ($($this).data('operator')==='minus'){
           if (val > min){
            $(input).val(val-1);
           }
       } else {
           if (val < max){
            $(input).val(val+1);
           }
       }
    inM2Titler($($this).parents('.form-group').find('input[data-unit="PCE"]'));
    $($this).parents('td.count').find('button[value="cart/change"]').trigger('click');
}

function inM2Titler($this){
     var inM2 = $($this).parents('form').find('.almost-equal').data('in'),
        prCount = $($this).parents('form').find('input[data-unit="PCE"]').val(),
        summaryM2 = Math.round(((prCount/inM2)*100))/100;
        $($this).parents('form').find('.almost-equal i').html(summaryM2);
}