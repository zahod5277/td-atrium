<?php

return array(
    'fields' => array(
        'category' => NULL,
        'collection' => NULL,
        'format' => NULL,
        'inM2' => NULL,
        'kafelType' => NULL,
        'primenenie' => NULL,
        'quantity' => NULL,
        'surface' => NULL,
        'box' => NULL,
        'distributor' => NULL,
        'avail' => NULL,
        'price_eu' => NULL,
        'unit' => NULL,
        'length' => NULL,
        'width' => NULL
    )
    , 'fieldMeta' => array(
        'category' => array(
            'dbtype' => 'varchar'
            , 'precision' => '125'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => NULL
        ),
        'price_eu' => array(
            'dbtype' => 'varchar'
            , 'precision' => '55'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => '0'
        ),
        'unit' => array(
            'dbtype' => 'varchar'
            , 'precision' => '55'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => NULL
        ),
        'avail' => array(
            'dbtype' => 'varchar'
            , 'precision' => '55'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => NULL
        ),
        'collection' => array(
            'dbtype' => 'varchar'
            , 'precision' => '55'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => NULL
        ),
        'format' => array(
            'dbtype' => 'varchar'
            , 'precision' => '55'
            , 'phptype' => 'string'
            , 'null' => true
            , 'default' => NULL
        ),
        'inM2' => array(
            'dbtype' => 'varchar',
            'precision' => '15',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'kafelType' => array(
            'dbtype' => 'varchar',
            'precision' => '55',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'primenenie' => array(
            'dbtype' => 'varchar',
            'precision' => '55',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'quantity' => array(
            'dbtype' => 'varchar',
            'precision' => '15',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'surface' => array(
            'dbtype' => 'varchar',
            'precision' => '55',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'box' => array(
            'dbtype' => 'varchar',
            'precision' => '55',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'distributor' => array(
            'dbtype' => 'varchar',
            'precision' => '55',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'length' => array(
            'dbtype' => 'varchar',
            'precision' => '15',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        ),
        'width' => array(
            'dbtype' => 'varchar',
            'precision' => '15',
            'phptype' => 'string',
            'null' => true,
            'default' => NULL
        )
    )
    , 'indexes' => array(
        'category' => array(
            'alias' => 'category'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'collection' => array(
            'alias' => 'collection'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'unit' => array(
            'alias' => 'unit'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'price_eu' => array(
            'alias' => 'price_eu'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'avail' => array(
            'alias' => 'avail'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'format' => array(
            'alias' => 'format'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'inM2' => array(
            'alias' => 'inM2'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'kafelType' => array(
            'alias' => 'kafelType'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'primenenie' => array(
            'alias' => 'primenenie'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'quantity' => array(
            'alias' => 'quantity'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'length' => array(
            'alias' => 'length'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'width' => array(
            'alias' => 'width'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'surface' => array(
            'alias' => 'surface'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'box' => array(
            'alias' => 'box'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        ),
        'distributor' => array(
            'alias' => 'distributor'
            , 'primary' => false
            , 'unique' => false
            , 'type' => 'BTREE'
            , 'columns' => array(
                'action' => array(
                    'length' => ''
                    , 'collation' => 'A'
                    , 'null' => false
                )
            )
        )
    )
);
