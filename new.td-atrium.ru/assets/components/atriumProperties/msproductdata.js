miniShop2.plugin.atriumProperties = {
    getFields: function (config) {
        return {
            category: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+category]]</b><br />' + _('ms2_product_category_help')},
            avail: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+avail]]</b><br />' + _('ms2_product_avail_help')},
            price_eu: {xtype: 'textfield', description: '<b>[[+price_eu]]</b><br />' + _('ms2_product_price_eu_help')},
            unit: {xtype: 'textfield', description: '<b>[[+unit]]</b><br />' + _('ms2_product_unit_help')},
            collection: {xtype: 'textfield', description: '<b>[[+collection]]</b><br />' + _('ms2_product_collection_help')},
            format: {xtype: 'textfield', description: '<b>[[+format]]</b><br />' + _('ms2_product_format_help')},
            inM2: {xtype: 'textfield', description: '<b>[[+inM2]]</b><br />' + _('ms2_product_inM2_help')},
            kafelType: {xtype: 'textfield', description: '<b>[[+kafelType]]</b><br />' + _('ms2_product_kafelType_help')},
            primenenie: {xtype: 'textfield', description: '<b>[[+primenenie]]</b><br />' + _('ms2_product_primenenie_help')},
            quantity: {xtype: 'textfield', description: '<b>[[+quantity]]</b><br />' + _('ms2_product_quantity_help')},
            surface: {xtype: 'textfield', description: '<b>[[+surface]]</b><br />' + _('ms2_product_surface_help')},
            box: {xtype: 'textfield', description: '<b>[[+box]]</b><br />' + _('ms2_product_box_help')},
            distributor: {xtype: 'textfield', description: '<b>[[+distributor]]</b><br />' + _('ms2_product_distributor_help')},
            length: {xtype: 'textfield', description: '<b>[[+length]]</b><br />' + _('ms2_product_length_help')},
            width: {xtype: 'textfield', description: '<b>[[+width]]</b><br />' + _('ms2_product_width_help')}
        }
    }
    , getColumns: function () {
        return {
            category: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'category'}},
            avail: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'avail'}},
            price_eu: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'price_eu'}},
            unit: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'unit'}},
            collection: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'collection'}},
            format: {width: 20, sortable: false, editor: {xtype: 'textfield', name: 'format'}},
            inM2: {width: 20, sortable: false, editor: {xtype: 'textfield', name: 'inM2'}},
            kafelType: {width: 20, sortable: false, editor: {xtype: 'textfield', name: 'kafelType'}},
            primenenie: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'primenenie'}},
            quantity: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'quantity'}},
            surface: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'surface'}},
            box: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'box'}},
            distributor: {width: 50, sortable: false, editor: {xtype: 'textfield', name: 'distributor'}},
            length: {width: 25, sortable: false, editor: {xtype: 'textfield', name: 'length'}},
            width: {width: 25, sortable: false, editor: {xtype: 'textfield', name: 'width'}}
        }
    }
};