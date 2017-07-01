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
        if (($result)!=false){
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
    
    function createVendor($vendor_name){
        $vendor = $this->modx->newObject('msVendor',[
            'name' => $vendor_name
        ]);
        $vendor->save();
        return $vendor->get('id');
    }
    
    function createVendorCategory($vendor_id,$category){
        
        
        return $response;
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
    
    function getVendorResource($vendor_id,$category){
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
    
    function productSizeFormatter($size){
        return explode('x', $size);
    }
}
