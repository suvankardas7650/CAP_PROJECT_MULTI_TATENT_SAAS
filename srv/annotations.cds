using OperationsService from './asset-service';
using TenantService     from './tenant-service';

/* ===================================================== */
/*  SERVICE REQUESTS                                    */
/* ===================================================== */

annotate OperationsService.ServiceRequests with @(

    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : requestNo },
            { $Type : 'UI.DataField', Value : requestDate },
            { $Type : 'UI.DataField', Value : status }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Request Details',
            Target : '@UI.FieldGroup#General'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : requestNo },
        { $Type : 'UI.DataField', Value : requestDate },
        { $Type : 'UI.DataField', Value : status }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Value : requestNo },
        { $Type : 'UI.DataField', Value : requestDate },
        { $Type : 'UI.DataField', Value : status }
    ]
);


/* ===================================================== */
/*  SERVICE ITEMS                                       */
/* ===================================================== */

annotate OperationsService.ServiceItems with @(

    UI.FieldGroup #ItemInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : description },
            { $Type : 'UI.DataField', Value : cost }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Item Information',
            Target : '@UI.FieldGroup#ItemInfo'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : description },
        { $Type : 'UI.DataField', Value : cost }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Value : description },
        { $Type : 'UI.DataField', Value : cost }
    ]
);


/* ===================================================== */
/*  INVOICES                                            */
/* ===================================================== */

annotate OperationsService.Invoices with @(

    UI.FieldGroup #InvoiceInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : invoiceNo },
            { $Type : 'UI.DataField', Value : invoiceDate },
            { $Type : 'UI.DataField', Value : totalAmount },
            { $Type : 'UI.DataField', Value : status }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Invoice Details',
            Target : '@UI.FieldGroup#InvoiceInfo'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : invoiceNo },
        { $Type : 'UI.DataField', Value : invoiceDate },
        { $Type : 'UI.DataField', Value : totalAmount },
        { $Type : 'UI.DataField', Value : status }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Value : invoiceNo },
        { $Type : 'UI.DataField', Value : invoiceDate },
        { $Type : 'UI.DataField', Value : totalAmount },
        { $Type : 'UI.DataField', Value : status }
    ]
);


/* ===================================================== */
/*  TENANTS (VENDORS)                                   */
/* ===================================================== */

annotate TenantService.Tenants with @(

    UI.FieldGroup #VendorInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : name },
            { $Type : 'UI.DataField', Value : category },
            { $Type : 'UI.DataField', Value : contactNo },
            { $Type : 'UI.DataField', Value : status }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Vendor Information',
            Target : '@UI.FieldGroup#VendorInfo'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : name },
        { $Type : 'UI.DataField', Value : category },
        { $Type : 'UI.DataField', Value : status }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Value : name },
        { $Type : 'UI.DataField', Value : contactNo },
        { $Type : 'UI.DataField', Value : status }
    ]
);


/* ===================================================== */
/*  SUBSCRIPTIONS                                       */
/* ===================================================== */

annotate TenantService.Subscriptions with @(

    UI.FieldGroup #SubscriptionInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : planName },
            { $Type : 'UI.DataField', Value : assetLimit },
            { $Type : 'UI.DataField', Value : expiryDate }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Subscription Details',
            Target : '@UI.FieldGroup#SubscriptionInfo'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : planName },
        { $Type : 'UI.DataField', Value : assetLimit },
        { $Type : 'UI.DataField', Value : expiryDate },

        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'TenantService.buy',
            Label  : 'Buy Plan'
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'TenantService.upgrade',
            Label  : 'Upgrade Plan'
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'TenantService.cancel',
            Label  : 'Cancel Plan'
        }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Value : planName },
        { $Type : 'UI.DataField', Value : assetLimit },
        { $Type : 'UI.DataField', Value : expiryDate }
    ]
);
