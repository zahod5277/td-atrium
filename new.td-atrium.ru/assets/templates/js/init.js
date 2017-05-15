jQuery(document).ready(function () {
    $('.collapse-menu').on('click', function () {
        $(this).toggleClass('glyphicon-minus');
        $(this).toggleClass('active-icon');
        $(this).siblings('.level-1-link').toggleClass('active-link');
        $(this).siblings('.level-2').toggle("fast");
    });
    summChanger($('input[name="count"]').val());
    $(".mfilter-param input").on('change', function () {
        $("#categories-list").hide();
    });
    $('body').on('change', 'input[name="count"]', function () {
        inM2Titler(this);
    });
    $('#result').on('click', 'i', function () {
        quantityChanger($(this));
    });
    $('.quantity-operator').on('click', function () {
        quantityChanger($(this));
    });
    $('body').on('change', '.countInput', function () {
        var val = $(this).val();
        summChanger(val);
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

function quantityChanger($this) {
    var input = $($this).parents('.form-group').find('input[name="count"]'),
            min = 1,
            val = parseInt($(input).val());
    if ($($this).data('operator') === 'minus'){
        if (val > min) {
            val--;
            $(input).val(val);
        }
    } else {
            val++;
            $(input).val(val);
    }
    summChanger(input, val);
    $(input).trigger('change');
    $($this).parents('td.count').find('button[value="cart/change"]').trigger('click');
}

function inM2Titler($this) {
    var inM2 = $($this).parents('form').find('.almost-equal').data('in'),
        prCount = $($this).parents('form').find('input[data-unit="MTK"]').val(),
        summaryM2 = Math.round(((prCount / inM2) * 100)) / 100;
    $($this).parents('form').find('.almost-equal i').html(summaryM2);
}

function summChanger(val) {
    if ($('#mainPrice span').is('.price')) {
        var price = $('#mainPrice .price-main span.price').html(),
            sumPrice = Math.round(((price.replace(' ', '') * val)*100)/100);
        $('#product_total span').html(sumPrice);
    }
}