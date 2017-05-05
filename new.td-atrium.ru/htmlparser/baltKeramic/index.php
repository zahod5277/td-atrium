<?php

require_once '../baseClass/parser.php';
echo '<html>'
 . '<head>'
 . '</head>'
 . '<body>'
 . '<form action="index.php" method="POST">'
 . '<input type="text" name="page" placeholder="Введите адрес страницы">'
 . '<button class="copy" type="submit">Парсить!</button><br><hr>'
 . '</form>';
if (isset($_POST['page'])) {
    $url = $_POST['page'];
    $path = '../phpQuery/phpQuery.php';
    $page = new parser($url);
    $brand = 'King Klinker';
    $baseUrl = 'http://www.baltceramic.ru';
    $country = 'Польша';
    if ($page->createParser($path)) {
        if (!$page->getContent()) {
            die('нет контента');
        }
        $array = array();
        $document = phpQuery::newDocument($page->content);

        $products = $page->products = $document->find('.one_position');

        foreach ($products as $product) {
            $pq = pq($product)->find('a#one_position_title');
            $url = $baseUrl . $pq->attr('href');
            $innerPage = new parser($url);
            if ($innerPage->createParser($path)) {
                $innerPage->getContent();
                $inPage = phpQuery::newDocument($innerPage->content);
                $block = $inPage->find('#content_right');
                $title = pq($block)->find('.catalog_title')->text();
                $img = $baseUrl . pq($block)->find('.fancybox_alt')->attr('href');
                $image = $page->saveImg($img);
                $price = pq($block)->find('#price_table_thing>#price')->text();
                $unit = pq($block)->find('#price_table_thing>#unit')->text();
                $descr = pq($block)->find('#detail_text')->text();
                $table = pq($block)->find('.product-info-table>tr:nth-child(3)');
                $format = pq($table)->find('td:first')->text();
                $weight = pq($table)->find('td:nth-child(2)')->text();
                $size = pq($table)->find('td:nth-child(3)')->text();
                $inM2 = pq($table)->find('td:nth-child(5)')->text();
                $pricePCE = pq($table)->find('td:nth-child(6)')->text();
                $priceM2 = pq($table)->find('td:nth-child(7)')->text();
            } else {
                echo '<br>Не могу открыть вложенную страницу';
            }
            $array[] = array(
                'title' => $title,
                'img' => $image,
                'unit' => $unit,
                'descr' => $descr,
                'format' => $format,
                'weight' => $weight,
                'size' => $size,
                'inM2' => $inM2,
                'pricePCE' => $pricePCE,
                'priceM2' => $priceM2
            );
        }
    } else {
        die('Ниработает ничо');
    }

    if (count($array) > 1) {
        echo '<table id="table" class="table">';
        foreach ($array as $products) {
            echo '<tr>';
            echo $page->getTd($products['title']);
            echo $page->getTd($country);
            echo $page->getTd($brand);
            echo $page->getTd($products['unit']);
            echo $page->getTd($products['descr']);
            echo $page->getTd($products['format']);
            echo $page->getTd($products['weight']);
            echo $page->getTd($products['size']);
            echo $page->getTd($products['inM2']);
            echo $page->getTd($products['pricePCE']);
            echo $page->getTd($products['priceM2']);
            echo $page->getTd($products['img']);
            echo '</tr>';
        }
    }
}
echo '</table></body></html>';
//$next = $document->find('.modern-page-next')->attr('href');
//$products = $document->find('.one_position');
//
//foreach ($products as $product){
//    $pq = pq($el);
//    $html .= $pq->find('a#one_position_title>span')->text();
//    
//}
//
//return print_r($html);
