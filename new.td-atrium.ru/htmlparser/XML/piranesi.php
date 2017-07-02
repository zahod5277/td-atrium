<?php

$file = simplexml_load_file('piranesi.xml');
$vendor = [
    'Azori',
    'Ceradim',
    'Ceramica Classic',
    'Kerama Marazzi',
    'Kerranova',
    'LB-Ceramics',
    'Дельта Керамика',
    'Италон',
    'Муза-Керамика',
    'Уралкерамика',
    'Эстима',
];
//echo $file->collection[0];
$ceramica = $file->groupProduct[0];
echo '<table>';
echo '<thead>
    <td>id</td>
    <td>Название+id</td>
<td>Производитель</td>
<td>Страна</td>
<td>Фотографии интерьера</td>
</thead>';
foreach ($ceramica->collection_list->collection as $collection) {
    $id = $collection['id'];
    $name = $collection->name;
    $interior = $collection->interior_list->interior[0];
    $brand = $collection->brand;
    $country = $collection->country;
    if (in_array($brand, $vendor)) {
        echo '<tr>';
        echo '<td style="border:1px solid black;padding:5px">' . $id . '</td>';
        echo '<td style="border:1px solid black;padding:5px">' . $name . '</td>';
        echo '<td style="border:1px solid black;padding:5px">' . $name . ' id: ' . $id . '</td>';
        echo '<td style="border:1px solid black;padding:5px">' . $brand . '</td>';
        echo '<td style="border:1px solid black;padding:5px">' . $country . '</td>';
        echo '<td style="border:1px solid black;padding:5px"><a target="blank" href="' . $interior . '">' . $interior . '</a></td>';
        $collections[] = [
            'id' => $id,
            'name' => $name,
            'interior' => $interior,
            'brand' => $brand,
            'country' => $country
        ];
        echo '</tr>';
    }
}
echo '</table>';
//foreach ($ceramica->element_list->element as $element){
//    $id = $element['id'];
//    $name = $element->name;
//    echo '<br>!!!-'.$name;
//    $price = $element->price;
//    $edizm = $element->edizm;
//    $balance = $element->balance;
//    $balance_count = $element->balanceCount;
//    $category = $element->category;
//    $collection_list = $element->collection_list;
//    $field_of_application_list = $element->field_of_application_list;
//    $place_in_the_collection = $element->place_in_the_collection;
//    $minpart_list = $element->minpart_list;
//    $weight_list = $element->weight_list;
//    $size = $element->size;
//    $architectural_surface = $element->architectural_surface;
//    $BaseValue = $element->BaseValue;
//    $ColorValue = $element->ColorValue;
//    $CoverValue = $element->CoverValue;
//    $SurfaceValue = $element->SurfaceValue;
//    $frost_hardiness = $element->frost_hardiness;
//    $Rectified = $element->Rectified;
//    $pic = $element->pic;
//    
//}
//var_dump($collections);
//print_r($file);