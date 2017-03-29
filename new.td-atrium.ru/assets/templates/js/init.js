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
    $('.one-click-buy').click(function () {
        var product = $(this).data('product');
        $('#call-me-form input[name="product"]').val(product);
    });
    $('.countInput').on('change', function () {
        var val = $('#product_price').val() * $('#quan').val();
        $('#product_total span').html(val);
        if ($('#quan option[value="' + $('#quan').val() + '"]').data('unit') === 'шт') {
            $('input[name="options[m2price]"').val('');
        } else {
            $('input[name="options[m2price]"').val(val / $('#quan option[data-unit="м2"]').val());
        }
    });
    //быстрый просмотр товара
    // Вешаем обработчик события "клик" на все ссылки с классом ajax_link
    $('body').on('click', '.ajax_link', function () {
        // Берем действие из атрибута data-action ссылки
        var action = 'quickview';
        var id = $(this).data('action');
        $.post('ajax.php', {action: action, id: id}, function (data) {
            // Выдаем ответ
            $('#product-modal').modal('show');
            $('#result').html(data);
        })
        // Не даем ссылке кликнуться - нам же не нужна перезагрузка страницы?
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