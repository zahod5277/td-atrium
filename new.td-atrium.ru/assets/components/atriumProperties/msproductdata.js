miniShop2.plugin.atriumProperties = {
    getFields: function (config) {
        return {
            category: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+category]]</b><br />' + _('ms2_product_category_help')},
            avail: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+avail]]</b><br />' + _('ms2_product_avail_help')},
            price_eu: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+price_eu]]</b><br />' + _('ms2_product_price_eu_help')},
            unit: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+unit]]</b><br />' + _('ms2_product_unit_help')},
            collection: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+collection]]</b><br />' + _('ms2_product_collection_help')},
            format: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+format]]</b><br />' + _('ms2_product_format_help')},
            inM2: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+inM2]]</b><br />' + _('ms2_product_inM2_help')},
            kafelType: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+kafelType]]</b><br />' + _('ms2_product_kafelType_help')},
            primenenie: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+primenenie]]</b><br />' + _('ms2_product_primenenie_help')},
            quantity: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+quantity]]</b><br />' + _('ms2_product_quantity_help')},
            surface: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+surface]]</b><br />' + _('ms2_product_surface_help')},
            box: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+box]]</b><br />' + _('ms2_product_box_help')},
            distributor: {xtype: 'minishop2-combo-autocomplete', description: '<b>[[+distributor]]</b><br />' + _('ms2_product_distributor_help')}
        }
    }
    , getColumns: function () {
        return {
            category: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'category'}},
            avail: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'avail'}},
            price_eu: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'price_eu'}},
            unit: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'unit'}},
            collection: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'collection'}},
            format: {width: 20, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'format'}},
            inM2: {width: 20, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'inM2'}},
            kafelType: {width: 20, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'kafelType'}},
            primenenie: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'primenenie'}},
            quantity: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'quantity'}},
            surface: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'surface'}},
            box: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'box'}},
            distributor: {width: 50, sortable: false, editor: {xtype: 'minishop2-combo-autocomplete', name: 'distributor'}}
        }
    }
};