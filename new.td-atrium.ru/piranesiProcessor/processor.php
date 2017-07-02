<?php

class pirProcessor {

    public $modx;
    public $resourceTree = [
        'Плитка' => 3,
        'Керамогранит' => 4,
        'Мозаика' => 3173,
        'Не определено' => 3
    ];

    function __construct(modX &$modx) {
        $this->modx = & $modx;
        $this->pdoFetch = $this->modx->getService('pdofetch', 'pdoFetch', MODX_CORE_PATH . 'components/pdotools/model/pdotools/', array());
    }

    function checkCollection($tvValue) {
        $query = $this->modx->newQuery('modResource');
        $query->leftJoin('modTemplateVarResource', 'TV', 'TV.contentid = modResource.id');
        $query->where([
            'TV.tmplvarid' => 2,
            'TV.value' => $tvValue
        ]);
        $query->prepare();
        //return $query->toSQL();
        $query->stmt->execute();
        $result = $query->stmt->fetch(PDO::FETCH_ASSOC);
        if (($result) != false) {
            $output = $result['modResource_id'];
        } else {
            $output = 'empty';
        }
        return $output;
    }

    function checkVendor($vendor_name) {
        $vendor = $this->modx->getObject('msVendor', ['name' => $vendor_name]);
        if (!is_null($vendor)) {
            $status = true;
        } else {
            $status = false;
        }
        if ($status === true) {
            $result = $vendor->get('id');
        } else {
            $result = false;
        }
        return $result;
    }

    function createVendor($vendor_name) {
        $vendor = $this->modx->newObject('msVendor', [
            'name' => $vendor_name
        ]);
        $vendor->save();
        return $vendor->get('id');
    }

    function createAlias($pagetitle) {
        $page = $this->modx->newObject('modResource');
        $alias = $page->cleanAlias($pagetitle);
        return $alias;
    }

    function createDocument($properties) {
//        $output = [
//          'properties' => $properties
//        ];
        //return $output;
        $response = $this->modx->runProcessor('resource/create', $properties);
        if ($response->isError()) {
            return $this->modx->error->failure($response->getMessage());
        }
        return $response->getObject();
    }

    function getFileByFTP($file) {
        $basename = basename($file);
        $filename = 'files/' . $basename;
        $rawFile = file_get_contents($row['col_col_interior']);
        file_put_contents($filename, $rawFile);
        return $filename;
    }

    function getInterior($row) {
        if ($row['col_col_interior'] != '') {
            $file = 'files/' . basename($row['col_col_interior']);
            //echo 'Проверяем, есть ли файл ' . $file . '<br>';
            if (!file_exists($file)) {
                $filename = $this->getFileByFTP($row['col_col_interior']);
                //echo 'файла не было, скачали<br>';
            } else {
                $filename = $file;
                //echo 'файл существует, пропускаем<br>';
            }
        }
        return $filename;
    }

    function getVendorResource($vendor_id, $category) {
        $query = $this->modx->newQuery('modResource');
        $query->leftJoin('modTemplateVarResource', 'TV', 'TV.contentid = modResource.id');
        $query->where([
            'TV.tmplvarid' => 3,
            'TV.value' => $vendor_id,
            'modResource.parent' => $category
        ]);
        $query->prepare();
//        return $query->toSQL();
        $query->stmt->execute();
        $result = $query->stmt->fetch(PDO::FETCH_ASSOC);
        return $result['modResource_id'];
    }

    function productSizeFormatter($size) {
        return explode('х', $size);
    }

    function productColorFormatter($color) {
        return json_encode(explode(';', $color));
    }

    //да простит меня великий рэндом за это.
    //но с регуляркой я чото не смог
    function productSqareBracketsRemove($string) {
        $string = str_replace('["', '', $string);
        $string = str_replace('"]', '', $string);
        $output = explode(',', $string);
        return $output;
    }

    function productWeightFormatter($weight, $offset) {
        $strpos = stripos($weight, '- ');
        $endstrpos = stripos($weight, ' кг');
        $str_length = $endstrpos - $strpos;
        $str = substr($weight, $strpos + $offset, $str_length - $offset);
        return $str;
    }

    function productCreate($row, $parent, $vendor_id) {
        //обрабатываем входные данные для соответствия БД
        $size = $this->productSizeFormatter($row['el_size']);
        $sizeInM2 = floatval($size[0] * 0.01) * floatval($size[1] * 0.01);
        $inM2 = round(1 / $sizeInM2);
        $color = $this->productColorFormatter($row['el_ColorValue']);
        $box = $this->productSqareBracketsRemove($row['el_box']);
        $primenenie = $this->productSqareBracketsRemove($row['el_application']);
        $pic = $this->getFileByFTP($row['el_pic']);
        $weight = $this->productWeightFormatter($row['el_box'], 2);

        if ($row['el_edizm_edizm'] == 'шт') {
            $edizm = 'шт.';
        } elseif ($row['el_edizm_edizm'] == 'м2') {
            $edizm = 'м.кв.';
        }

        //Заполняем массив с товарами
        $productProperties = [
            'price' => $row['el_price'],
            'article' => $row['el_code'],
            'pagetitle' => $row['el_name'],
            'unit' => $edizm,
            'made_in' => $row['col_col_country'],
            'color' => $color,
            'collection' => $row['col_col_name'],
            'inM2' => $inM2,
            'quantity' => '',
            'box' => $box[0],
            'primenenie' => $primenenie[0],
            'weight' => $weight,
            'width' => $size[0]*0.01,
            'length' => $size[1]*0.01,
            'vendor' => $vendor_id,
            'category' => $row['el_category'],
            'surface' => $row['el_surface'],
            'distibutor' => 'piranesi',
            'kafelType' => $row['el_place'],
            'class_key' => 'msProduct',
            'published' => 1,
            'template' => 7,
            'parent' => $parent
        ];
        $product = $this->createDocument($productProperties);
        $img = $this->productGalleryUpload($pic, $product['id']);
        $response = [
            'product' => $product['id'],
            'img' => $img
        ];
        return $response;
    }

    function productGalleryUpload($pic, $resource) {
        $name = basename($pic);
        $response = $this->modx->runProcessor('gallery/upload', array(
            'id' => $resource,
            'name' => $name, 
            'file' => $pic,
                ), array(
            'processors_path' =>  'core/components/minishop2/processors/mgr/'
                )
        );
        return $response;
    }

}
